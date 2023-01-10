//
//  CategoriesViewModelProtocol.swift
//  UIKitHW
//
//  Created by Константин Грачев on 09.01.2023.
//

import Foundation

protocol MainViewModelProtocol {
    var title: String? { get }
    var namesCategories: [String]? { get }
    var dataManager: MockNetworkManager? { get set }
}
