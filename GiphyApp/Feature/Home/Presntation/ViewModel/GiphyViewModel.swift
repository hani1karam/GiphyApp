//
//  GiphyViewModel.swift
//  GiphyApp
//
//  Created by hany karam on 2/19/22.
//

import RxSwift
class GiphyViewModel{
    let giphyUseCase: GiphyUseCase    
    init(giphyUseCase: GiphyUseCase) {
        self.giphyUseCase = giphyUseCase
    }
    func featchGiphy() -> Observable<GiphyModel>{
        return giphyUseCase.featchGiphy()
    }
}
