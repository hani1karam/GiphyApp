//
//  GiphyRepoImpl.swift
//  NetworkManager
//
//  Created by hany karam on 2/19/22.
//
import RxSwift
import NetworkManager
class GiphyRepoImpl:GiphyRepo{
    
    private var networkManager: DataProviderProtocol
    
    init(networkManager: DataProviderProtocol = APIClient()) {
        self.networkManager = networkManager
    }
    
    func featchGiphy() -> Observable<GiphyModel> {
        let placesRequest = SimpleGetRequest(url: "https://api.giphy.com/v1/gifs/trending?api_key=Ar4n9X5e98UlABp4o7hQNv9sLbkwA9mV&limit=25&rating=pg",parameters: nil, method: .get)
        return Observable.create{[weak self] (observer) -> Disposable in
            self?.networkManager.sentRequest(request: placesRequest, mapResponseOnType: GiphyModel.self, successHandler: { [weak self] (result)  in
                observer.onNext((result))
            })
            { (error) in
                print(error)
                observer.onError(error)
            }
            return Disposables.create()
        }
        
    }
}
