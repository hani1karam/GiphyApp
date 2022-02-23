//
//  GiphyAppTests.swift
//  GiphyAppTests
//
//  Created by hany karam on 2/18/22.
//

import XCTest
import NetworkManager
@testable import GiphyApp
protocol viewModelDelegate {
    func willShowRefresher()
}

final class PostsDelegationviewModel {
    var networkLayer: DataProviderProtocol = APIClient()
    var delegate: viewModelDelegate?
    var posts = [Datum] ()
    func loadData() {
        delegate?.willShowRefresher()
        let placesRequest = SimpleGetRequest(url: "https://api.giphy.com/v1/gifs/trending?api_key=Ar4n9X5e98UlABp4o7hQNv9sLbkwA9mV&limit=25&rating=pg",parameters: nil, method: .get)
        networkLayer.sentRequest(request: placesRequest, mapResponseOnType: GiphyModel.self) {[weak self] (respones) in
            guard let data = respones.data else {return}
            self?.posts = data
        } failureHandler: { (error) in
            print(error)
            
        }
    }
}

class GiphyAppTests: XCTestCase {
    
    func test_loadPosts_emptyCallRequest_beforeLoaded () {
        
        let (_ ,postSpy,_) = makeSUT()
        XCTAssertEqual(postSpy.loadPostsLoadCount, 0)
    }
    //delegationSpy
    func test_loadPosts_expectedOneCallRequest_afterLoaded () {
        let (sut,postSpy,delegationSpy) = makeSUT()
        
        sut.loadData()
        
        XCTAssertTrue(delegationSpy.willRefresh)
        XCTAssertEqual(postSpy.loadPostsLoadCount, 0)
        
    }
    
    func test_LoadOffersCompletion_ExpectSuccessResponesWithData_AfterLoaded() {
        // Given
        let (sut,postSpy,delegationSpy) = makeSUT()
        let posts = anyPosts()
        //When
        sut.loadData()
        postSpy.completePostsLoading(with: posts, at: 0)
        //Then
        XCTAssertTrue(!sut.posts.isEmpty,  "")
        //        XCTAssertFalse(delegateSpy.emptyOffersArray)
        
    }
    
    //MARK: - Helper
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: PostsDelegationviewModel , postsSpy: PostsSpy,delegationSpy: DelegationSpy ) {
        let sut = PostsDelegationviewModel()
        let postSpy = PostsSpy()
        let delegationSpy = DelegationSpy()
        trackForMemoryLeaks(instance: sut,file: file,line: line)
        return (sut,postSpy,delegationSpy)
    }
    
    func anyPosts () -> [GiphyModel] {
        return []
    }
}
final class PostsSpy: DataProviderProtocol{
    
    
    private var postsRequest = [(Result<[GiphyModel], Error>) -> Void] ()
    var loadPostsLoadCount: Int {
        return postsRequest.count
    }
    
    func getPosts(completion: @escaping (Result<[GiphyModel], Error>) -> Void) {
        postsRequest.append(completion)
    }
    func sentRequest<ResponseType>(request: RequestProtocol, mapResponseOnType: ResponseType.Type, successHandler: @escaping (ResponseType) -> Void, failureHandler: @escaping (Error) -> Void) where ResponseType : Decodable, ResponseType : Encodable {
        postsRequest.append { (reponse) in reponse}
    }
    
    func completePostsLoading(with posts:[GiphyModel] = [] ,at index: Int = 0) {
        postsRequest[index](.success(posts))
    }
    
}



final class DelegationSpy: viewModelDelegate {
    
    var willRefresh = false
    
    func willShowRefresher() {
        willRefresh =  true
    }
}
