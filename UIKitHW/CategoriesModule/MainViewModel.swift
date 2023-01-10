//
//  CategoriesViewModel.swift
//  UIKitHW
//
//  Created by Константин Грачев on 09.01.2023.
//

import Foundation

final class MainViewModel {
    var dataManager: MockNetworkManager?
}

//MARK: - CategoriesViewModelProtocol

extension MainViewModel: MainViewModelProtocol {
    func openCategoryVC(with name: String) {
       
    }
    
    var title: String? {
        dataManager?.getCategoriesTitle()
    }
    
    var namesCategories: [String]? {
        dataManager?.getCategoriesNames()
    }
}
