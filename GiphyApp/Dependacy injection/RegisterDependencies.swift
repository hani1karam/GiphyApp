//
//  RegisterDependencies.swift
//  GiphyApp
//
//  Created by hany karam on 2/19/22.
//

import Foundation
import Swinject

extension Container {
    func registerDependencies() {
        registerViewModel()
        registerCoordinator()
    }
    
}
