//
//  CategoriesViewModel.swift
//  UIKitHW
//
//  Created by Константин Грачев on 09.01.2023.
//

import Foundation

final class MainViewModel {
    var dataManager: MockNetworkManager?
    var coordinator: AppCoordinator?
}

//MARK: - CategoriesViewModelProtocol

extension MainViewModel: MainViewModelProtocol {
    var productTypes: [ProductType] {
        ProductType.allCases
    }
    
    func openCategoryVC(with productType: ProductType) {
        coordinator?.showCategory(with: productType)
    }
  
    var title: String? {
        dataManager?.getCategoriesTitle()
    }
}
