//
//  GiphyViewCoordinator.swift
//  GiphyApp
//
//  Created by hany karam on 2/19/22.
//

import RxSwift
import UIKit
class MoviesViewCoordinator:BaseCoordinator {
     lazy var disposeBag: DisposeBag = {
        return DisposeBag()
    }()
    private var viewModel: GiphyViewModel
    
    init(viewModel: GiphyViewModel) {
        self.viewModel = viewModel
    }
    override func start() -> UIViewController {
        let viewController = HomeVC(nibName: "HomeVC", bundle: nil)
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        viewController.branchesViewModel = viewModel
        self.navigationController.navigationItem.backBarButtonItem?.tintColor = UIColor(named: "white_color")
        self.navigationController.navigationBar.isTranslucent = true
        if var textAttributes = navigationController.navigationBar.titleTextAttributes {
            textAttributes[NSAttributedString.Key.foregroundColor] = UIColor.white
            navigationController.navigationBar.titleTextAttributes = textAttributes
        }
        self.navigationController.navigationBar.barTintColor = UIColor(named: "color_bar")
        self.navigationController.navigationBar.barStyle = UIBarStyle.black
        self.navigationController.navigationBar.tintColor = UIColor.white
        navigationController.viewControllers = [viewController]
        appDelegate?.window?.rootViewController = navigationController
        return viewController
        
    }
    
}
