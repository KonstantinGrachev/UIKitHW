//
//  CategoryViewModelProtocol.swift
//  UIKitHW
//
//  Created by Константин Грачев on 10.01.2023.
//

import Foundation

protocol CategoryViewModelProtocol {
    var coordinator: AppCoordinator? { get set }
    var dataManager: MockNetworkManager? { get set }
    var products: [ProductModel] { get set }
    var category: ProductType { get set }
}
