//
//  CategoriesViewModel.swift
//  UIKitHW
//
//  Created by Константин Грачев on 09.01.2023.
//

import Foundation

final class CategoriesViewModel {
    var dataManager = MockNetworkManager()
}

//MARK: - CategoriesViewModelProtocol

extension CategoriesViewModel: CategoriesViewModelProtocol {
    var title: String {
        dataManager.getCategoriesTitle()
    }
    
    var namesCategories: [String] {
        dataManager.getCategoriesNames()
    }
}
