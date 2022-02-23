//
//  BaseVoordinator.swift
//  GiphyApp
//
//  Created by hany karam on 2/19/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    func start() -> UIViewController
    func start(coordinator: Coordinator) -> UIViewController
    func didFinish(coordinator: Coordinator)
    func removeChildCoordinators()
}

class BaseCoordinator: Coordinator {
    var navigationController = UINavigationController()
    var childCoordinators = [Coordinator]()
    var parentCoordinator: Coordinator?
    func start() -> UIViewController {
        fatalError("Start method should be implemented.")
    }
    func start(coordinator: Coordinator) -> UIViewController {
        childCoordinators += [coordinator]
        coordinator.parentCoordinator = self
        return coordinator.start()
    }
    func removeChildCoordinators() {
        childCoordinators.forEach { $0.removeChildCoordinators() }
        childCoordinators.removeAll()
    }
    
    func didFinish(coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
