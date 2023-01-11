//
//  CategoryViewController.swift
//  UIKitHW
//
//  Created by Константин Грачев on 10.01.2023.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    //MARK: Constants
    enum Constants {
        static let backgroundColor: UIColor = .systemBackground
        static let buyButtonBackgroundColor: UIColor = .systemBlue
        static let buyButtonTintColor: UIColor = .white
        static let buyButtonCornerRadius: CGFloat = 10
        static let buyButtonLeadingAnchor: CGFloat = 20
        static let buyButtonTrailingAnchor: CGFloat = -20
        static let buyButtonHeightAnchor: CGFloat = 100
    }
    //MARK: UI
    private var segmentedControl = UISegmentedControl()
    private let productImageView = UIImageView()
    private let priceLabel = UILabel()
    
    private lazy var buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Buy", for: .normal)
        button.backgroundColor = Constants.buyButtonBackgroundColor
        button.tintColor = Constants.buyButtonTintColor
        button.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = Constants.buyButtonCornerRadius
        return button
    }()
    
    var viewModel: CategoryViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSegmentedControl()
        setupUI()
    }
    
    //MARK: action funcs
    @objc private func segmentedControlValueChanged() {
        updateUI()
    }
    
    @objc private func buyButtonTapped() {
        guard let product = viewModel?.products[segmentedControl.selectedSegmentIndex] else { return }
        viewModel?.coordinator?.showCart(with: product)
    }
    
    //MARK: Private funcs
    func configureSegmentedControl() {
        guard let products = viewModel?.products else { return }
        var productsTitles = [String]()
        products.forEach { productsTitles.append($0.name) }
        segmentedControl = UISegmentedControl(items: productsTitles)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        updateUI()
    }
    
    func updateUI() {
        guard let products = viewModel?.products else { return }
        let index = segmentedControl.selectedSegmentIndex
        let product = products[index]
        productImageView.image = UIImage(named: product.pictureName)
        priceLabel.text = "Price: \(product.price)$"
    }
    
    private func setupUI() {
        
        view.backgroundColor = Constants.backgroundColor
        title = viewModel?.category.rawValue
        
        let subviews = [productImageView,
                        segmentedControl,
                        priceLabel,
                        buyButton]
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subview)
        }
        
        NSLayoutConstraint.activate([
            segmentedControl.bottomAnchor.constraint(equalTo: productImageView.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            productImageView.heightAnchor.constraint(equalTo: view.widthAnchor),
            productImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            productImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buyButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.buyButtonLeadingAnchor),
            buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.buyButtonTrailingAnchor),
            buyButton.heightAnchor.constraint(equalToConstant: Constants.buyButtonHeightAnchor),
            buyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
