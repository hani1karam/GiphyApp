//
//  GiphyUseCase.swift
//  GiphyApp
//
//  Created by hany karam on 2/19/22.
//

import RxSwift
class GiphyUseCase{
    private let giphyRepo: GiphyRepo
    init(giphyRepo: GiphyRepo){
        self.giphyRepo = giphyRepo
    }
    func featchGiphy() -> Observable<GiphyModel>{
        return giphyRepo.featchGiphy()
        
    }
}
