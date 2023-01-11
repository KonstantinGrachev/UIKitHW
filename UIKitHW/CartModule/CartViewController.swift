//
//  CartViewController.swift
//  UIKitHW
//
//  Created by Константин Грачев on 11.01.2023.
//

import UIKit

final class CartViewController: UIViewController {
    
    enum Constants {
        static let backgroundColor: UIColor = .systemBackground
    }
    
    private let orderLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var viewModel: CartViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOrder()
        setupUI()
    }
    
    private func configureOrder() {
        guard let product = viewModel?.product else { return }
        orderLabel.text = """
You ordered \(product.name)
in the amount of $\(product.price)
"""
    }
    
    private func setupUI() {
        view.backgroundColor = Constants.backgroundColor
        
        let subviews = [orderLabel]
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subview)
        }
        
        NSLayoutConstraint.activate([
            orderLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            orderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            orderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
