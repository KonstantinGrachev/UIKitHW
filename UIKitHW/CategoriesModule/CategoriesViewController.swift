//
//  ViewController.swift
//  UIKitHW
//
//  Created by Konstantin Gracheff on 19.12.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: Constants
    enum Constants {
        static let basicLeadingAnchor: CGFloat = 30
        static let basicTrailingAnchor: CGFloat = -30
        
        static let titleLabelFont: UIFont = .systemFont(ofSize: 30, weight: .bold)
        
        static let viewBackgroundColor: UIColor = .systemBackground
    }
    
    //MARK: viewModel
    let viewModel: CategoriesViewModelProtocol = CategoriesViewModel()
    
    //MARK: UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.titleLabelFont
        label.text = viewModel.title
        return label
    }()
    
    //MARK: Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: setupUI
    private func setupUI() {
        view.backgroundColor = Constants.viewBackgroundColor
        
        let subviews = [titleLabel]
        subviews.forEach { view.addSubview($0) }
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.basicLeadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.basicTrailingAnchor)
        ])
    }
}

