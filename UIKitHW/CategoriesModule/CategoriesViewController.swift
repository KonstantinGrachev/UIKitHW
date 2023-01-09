//
//  ViewController.swift
//  UIKitHW
//
//  Created by Konstantin Gracheff on 19.12.2022.
//

import UIKit

final class CategoriesViewController: UIViewController {
    
    //MARK: Constants
    enum Constants {
        static let basicLeadingAnchor: CGFloat = 30
        static let basicTrailingAnchor: CGFloat = -30
        static let categoriesStackViewTopAnchor: CGFloat = 15
        
        static let titleLabelFont: UIFont = .systemFont(ofSize: 36, weight: .bold)
        
        static let viewBackgroundColor: UIColor = .systemBackground
    }
    
    //MARK: viewModel
    let categoriesViewModel: CategoriesViewModelProtocol = CategoriesViewModel()
    
    //MARK: UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.titleLabelFont
        label.text = categoriesViewModel.title
        return label
    }()
    
    private let firstCategory: CategoryView = {
        let view = CategoryView()
        return view
    }()
    
    private let secondCategory: CategoryView = {
        let view = CategoryView()
        return view
    }()
    
    private let thirdCategory: CategoryView = {
        let view = CategoryView()
        return view
    }()
    
    private lazy var categoriesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstCategory, secondCategory, thirdCategory])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    //MARK: Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCategoryViews()
        setDelegates()
        setupUI()
    }
    
    private func setDelegates() {
        firstCategory.delegate = self
        secondCategory.delegate = self
        thirdCategory.delegate = self
    }
    
    //MARK: setupUI
    private func configureCategoryViews() {
        let names = categoriesViewModel.namesCategories
        firstCategory.configure(with: names[0], UIImage(systemName: "folder.fill"))
        secondCategory.configure(with: names[1], UIImage(systemName: "folder.fill"))
        thirdCategory.configure(with: names[2], UIImage(systemName: "folder.fill"))
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
            categoriesStackView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.basicTrailingAnchor),
        ])
    }
}

extension CategoriesViewController: CategoryViewDelegate {
    func openVCwith(name: String) {
        print("open new module with: \(name)")
    }
}
