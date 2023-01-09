//
//  CategoryView.swift
//  UIKitHW
//
//  Created by Константин Грачев on 09.01.2023.
//

import UIKit

protocol CategoryViewDelegate: AnyObject {
    func openVCwith(name: String)
}

final class CategoryView: UIView {
    
    //MARK: Constants
    enum Constants {
        static let categoryIconImageViewSize: CGFloat = 60
        static let categoryIconImageViewTopBottomAnchor: CGFloat = -5
        static let basicLeadingAnchor: CGFloat = 10
        static let basicTrailingAnchor: CGFloat = -10
        static let divisionViewHeightAnchor: CGFloat = 1
        
        static let categoryNameLabelFont: UIFont = .systemFont(ofSize: 20, weight: .regular)
        
        static let viewBackgroundColor: UIColor = .clear
    }
    
    //MARK: CategoryViewDelegate
    weak var delegate: CategoryViewDelegate?
    
    //MARK: UI
    private let categoryIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let categoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.categoryNameLabelFont
        return label
    }()
    
    //MARK: Internal properties
    private lazy var tapScreen = UITapGestureRecognizer()
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setDelegates()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Internal func
    func configure(with categoryName: String, _ categoryIcon: UIImage?) {
        categoryNameLabel.text = categoryName
        categoryIconImageView.image = categoryIcon
    }
    
    //MARK: Private func
    private func setDelegates() {
        tapScreen.delegate = self
    }
    
    private func setupUI() {
        backgroundColor = .clear
        isUserInteractionEnabled = true
        addGestureRecognizer(tapScreen)
        
        let subviews = [categoryIconImageView, categoryNameLabel]
        subviews.forEach { subview in
            addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            categoryIconImageView.heightAnchor.constraint(equalToConstant: Constants.categoryIconImageViewSize),
            categoryIconImageView.widthAnchor.constraint(equalToConstant: Constants.categoryIconImageViewSize),
            categoryIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryIconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.categoryIconImageViewTopBottomAnchor),
            categoryIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.categoryIconImageViewTopBottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            categoryNameLabel.centerYAnchor.constraint(equalTo: categoryIconImageView.centerYAnchor),
            categoryNameLabel.leadingAnchor.constraint(equalTo: categoryIconImageView.trailingAnchor, constant: Constants.basicLeadingAnchor)
        ])
    }
}

//MARK: - UIGestureRecognizerDelegate
extension CategoryView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let delegate = delegate,
              let categoryName = categoryNameLabel.text else { return false }
        delegate.openVCwith(name: categoryName)
        return true
    }
}
