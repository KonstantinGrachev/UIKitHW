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
        vc.viewModel = MainViewModel()
        vc.viewModel?.coordinator = self
        vc.viewModel?.dataManager = dataManager
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showCategory(with productType: ProductType) {
        let vc = CategoryViewController()
        vc.viewModel?.coordinator = self
        let products = dataManager.getFullProducts(of: productType)
        vc.viewModel = CategoryViewModel(category: productType, products: products)
        vc.viewModel?.dataManager = dataManager
        navigationController.pushViewController(vc, animated: true)
    }
}
