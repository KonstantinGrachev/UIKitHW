//
//  CategoriesViewModelProtocol.swift
//  UIKitHW
//
//  Created by Константин Грачев on 09.01.2023.
//

import Foundation

protocol MainViewModelProtocol {
    var title: String? { get }
    var dataManager: MockNetworkManager? { get set }
    var coordinator: AppCoordinator? { get set }
    var productTypes: [ProductType] { get }
    
    func openCategoryVC(with productType: ProductType)
}
