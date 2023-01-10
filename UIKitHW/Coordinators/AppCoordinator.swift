//
//  AppCoordinator.swift
//  UIKitHW
//
//  Created by Константин Грачев on 10.01.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var dataManager: MockNetworkManager
    
    init(navigationController: UINavigationController, dataManager: MockNetworkManager) {
        self.navigationController = navigationController
        self.dataManager = dataManager
    }
    
    func start() {
        let vc = MainViewController()
        vc.coordinator = self
        vc.viewModel = MainViewModel()
        vc.viewModel?.dataManager = dataManager
        navigationController.pushViewController(vc, animated: true)
    }
}
