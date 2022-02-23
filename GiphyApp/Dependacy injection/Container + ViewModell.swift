//
//  Container + ViewModell.swift
//  GiphyApp
//
//  Created by hany karam on 2/19/22.
//

import Swinject
import SwinjectAutoregistration
import NetworkManager
extension Container {
    func registerViewModel() {
        autoregister(GiphyViewModel.self, initializer: GiphyViewModel.init)
        autoregister(GiphyUseCase.self, initializer: GiphyUseCase.init)

    }
     func registerCoordinator() {
        autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        autoregister(MoviesViewCoordinator.self, initializer: MoviesViewCoordinator.init)
        autoregister(GiphyRepo.self, initializer: GiphyRepoImpl.init)
        autoregister(DataProviderProtocol.self, initializer: APIClient.init)
 
    }
}
