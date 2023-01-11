//
//  ProductModel.swift
//  UIKitHW
//
//  Created by Константин Грачев on 11.01.2023.
//

import Foundation

struct ProductModel {
    var name: String
    var price: Int
    var pictureName: String
    var category: ProductType 
}

enum ProductType: String, CaseIterable {
    case grocery = "Grocery"
    case fruits = "Fruits"
    case vegetables = "Vegetables"
}
