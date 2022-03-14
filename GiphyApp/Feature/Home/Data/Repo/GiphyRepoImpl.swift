//
//  GiphyRepoImpl.swift
//  NetworkManager
//
//  Created by hany karam on 2/19/22.
//
import RxSwift
 class GiphyRepoImpl:GiphyRepo{
    private var giphyRemoteDataSourcesImpl: GiphyRemoteDataSources
    init(giphyRemoteDataSourcesImpl: GiphyRemoteDataSources){
        self.giphyRemoteDataSourcesImpl = giphyRemoteDataSourcesImpl
    }

    func featchGiphy() -> Observable<GiphyModel> {
        return giphyRemoteDataSourcesImpl.featchGiphy()
    }
}
