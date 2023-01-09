//
//  MockNetworkManager.swift
//  UIKitHW
//
//  Created by Константин Грачев on 09.01.2023.
//

import Foundation

final class MockNetworkManager {
    func getCategoriesNames() -> [String] {
        ["Vegetables",
        "Fruits",
        "Grocery"]
    }
    
    func getCategoriesTitle() -> String {
        "Categories"
    }
}
