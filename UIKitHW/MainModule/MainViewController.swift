//
//  ViewController.swift
//  UIKitHW
//
//  Created by Konstantin Gracheff on 19.12.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    //MARK: Constants
    enum Constants {
        static let basicLeadingAnchor: CGFloat = 30
        static let basicTrailingAnchor: CGFloat = -30
        static let categoriesStackViewTopAnchor: CGFloat = 15
        static let categoriesStackViewSpacing: CGFloat = 10
        
        static let titleLabelFont: UIFont = .systemFont(ofSize: 36, weight: .bold)
        
        static let viewBackgroundColor: UIColor = .systemBackground
    }
    
    //MARK: internal properties
    var viewModel: MainViewModelProtocol?
    
    //MARK: UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.titleLabelFont
        label.text = viewModel?.title
        return label
    }()
    
    private var categoryViews = [CategoryView]()
    
    private lazy var categoriesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: categoryViews)
        stackView.axis = .vertical
        stackView.spacing = Constants.categoriesStackViewSpacing
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    //MARK: Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCategoryViews()
        setupUI()
    }
    
    //MARK: setupUI
    private func configureCategoryViews() {
        guard let productTypes = viewModel?.productTypes else { return }
        for productType in productTypes {
            let categoryView = CategoryView()
            categoryView.delegate = self
            categoryView.configure(with: productType,
                                   UIImage(systemName: "folder.fill"))
            categoryViews.append(categoryView)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = Constants.viewBackgroundColor
        
        let subviews = [titleLabel,
                        categoriesStackView]
        subviews.forEach { view.addSubview($0) }
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.basicLeadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.basicTrailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            categoriesStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.categoriesStackViewTopAnchor),
            categoriesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.basicLeadingAnchor),
            categoriesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.basicTrailingAnchor),
        ])
    }
}

//MARK: - CategoryViewDelegate
extension MainViewController: CategoryViewDelegate {
    func openVCwith(typeOfProduct: ProductType) {
        viewModel?.coordinator?.showCategory(with: typeOfProduct)
    }
}
