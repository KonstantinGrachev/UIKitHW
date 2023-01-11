//
//  CartViewModel.swift
//  UIKitHW
//
//  Created by Константин Грачев on 11.01.2023.
//

import Foundation

class CartViewModel {
    var coordinator: AppCoordinator?
    var product: ProductModel
    
    init(product: ProductModel) {
        self.product = product
    }
}

extension CartViewModel: CartViewModelProtocol {}
