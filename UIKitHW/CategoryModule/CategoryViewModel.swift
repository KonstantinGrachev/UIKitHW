//
//  CategoryViewModel.swift
//  UIKitHW
//
//  Created by Константин Грачев on 10.01.2023.
//

import Foundation

final class CategoryViewModel {
    var coordinator: AppCoordinator?
    var dataManager: MockNetworkManager?
    var category: ProductType
    var products: [ProductModel]
    
    init(category: ProductType, products: [ProductModel]) {
        self.category = category
        self.products = products
    }
}

extension CategoryViewModel: CategoryViewModelProtocol {}
