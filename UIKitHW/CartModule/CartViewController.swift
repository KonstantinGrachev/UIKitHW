//
//  CartViewController.swift
//  UIKitHW
//
//  Created by Константин Грачев on 11.01.2023.
//

import UIKit

class CartViewController: UIViewController {
    
    enum Constants {
        static let backgroundColor: UIColor = .systemBackground
    }
    
    var viewModel: CartViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = Constants.backgroundColor
    }
}
