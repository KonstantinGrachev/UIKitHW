//
//  MockNetworkManager.swift
//  UIKitHW
//
//  Created by Константин Грачев on 09.01.2023.
//

import Foundation

final class MockNetworkManager {
    
    func getCategoriesNames() -> [String] {
        var categories = [String]()
        for category in ProductType.allCases {
            categories.append(category.rawValue)
        }
        return categories
    }
    
    func getCategoriesTitle() -> String {
        "Categories"
    }
    
    func getFullProducts(of type: ProductType) -> [ProductModel] {
        switch type {
        case .grocery:
            let products = [ProductModel(name: "Cake", price: 5, pictureName: "cake", category: .grocery),
                            ProductModel(name: "Donut", price: 2, pictureName: "donut", category: .grocery),
                            ProductModel(name: "Bread", price: 3, pictureName: "bread", category: .grocery),
                            ProductModel(name: "Bun", price: 4, pictureName: "bun", category: .grocery)]
            return products
        case .fruits:
            let products = [ProductModel(name: "Banana", price: 5, pictureName: "banana", category: .fruits),
                            ProductModel(name: "Orange", price: 4, pictureName: "orange", category: .fruits),
                            ProductModel(name: "Apple", price: 3, pictureName: "apple", category: .fruits)]
            return products
        case .vegetables:
            let products = [ProductModel(name: "Potato", price: 2, pictureName: "potato", category: .vegetables),
                            ProductModel(name: "Onion", price: 2, pictureName: "onion", category: .vegetables),
                            ProductModel(name: "Watermelon", price: 4, pictureName: "watermelon", category: .vegetables)]
            return products
        }
    }
}
