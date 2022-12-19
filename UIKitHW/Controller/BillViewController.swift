//
//  BillViewController.swift
//  UIKitHW
//
//  Created by Константин Грачев on 19.12.2022.
//

import UIKit

final class BillViewController: UIViewController {
    
    //MARK: Constants
    enum Constants {
        enum Colors {
            static let divisionViewColor: UIColor = .systemGray3
            static let subheaderTextColor: UIColor = .systemGray2
            static let totalLabelColor: UIColor = #colorLiteral(red: 0.3634865582, green: 0.7221052051, blue: 0.353736043, alpha: 1)
        }
        
        enum Constraints {
            static let stackViewSpacing: CGFloat = 10
            static let cornerRadius: CGFloat = 10
            
            static let generalStackViewSideAnchor: CGFloat = 20
            
            static let totalLabelBottomAnchor: CGFloat = 50
            static let totalLabelHeightAnchor: CGFloat = 70
            static let totalLabelWidthAnchor: CGFloat = 200
        }
        
        enum Fonts {
            static let headerLabelFont: UIFont = .boldSystemFont(ofSize: 20)
            static let subheaderLabelFont: UIFont = .systemFont(ofSize: 16)
            static let totalLabelTitleFont: UIFont = .boldSystemFont(ofSize: 16)
        }
    }
    
    //MARK: UI
    private let firstHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Caesar salad"
        label.font = Constants.Fonts.headerLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstSubHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Tomato, Iceberg lettuce, crackers, chicken"
        label.font = Constants.Fonts.subheaderLabelFont
        label.textColor = Constants.Colors.subheaderTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstTotalLabel: UILabel = {
        let label = UILabel()
        label.text = "10$"
        label.font = Constants.Fonts.subheaderLabelFont
        label.textColor = Constants.Colors.subheaderTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstHorizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstHeaderLabel,
                                                       firstTotalLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private let firstDivisionView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.divisionViewColor
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var firstVerticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstHorizontalStackView,
                                                       firstSubHeaderLabel,
                                                       firstDivisionView
                                                      ])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private let secondHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Greek salad"
        label.font = Constants.Fonts.headerLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondSubHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Tomato, Iceberg lettuce, crackers, chicken"
        label.font = Constants.Fonts.subheaderLabelFont
        label.textColor = Constants.Colors.subheaderTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondTotalLabel: UILabel = {
        let label = UILabel()
        label.text = "20$"
        label.font = Constants.Fonts.subheaderLabelFont
        label.textColor = Constants.Colors.subheaderTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondHorizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [secondHeaderLabel,
                                                       secondTotalLabel
                                                      ])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private let secondDivisionView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.divisionViewColor
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var secondVerticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [secondHorizontalStackView,
                                                       secondSubHeaderLabel,
                                                       secondDivisionView
                                                      ])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private lazy var generalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstVerticalStackView,
                                                       secondVerticalStackView
                                                      ])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total: 30$"
        label.layer.cornerRadius = Constants.Constraints.cornerRadius
        label.clipsToBounds = true
        label.textAlignment = .center
        label.font = Constants.Fonts.totalLabelTitleFont
        label.backgroundColor = Constants.Colors.totalLabelColor
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    @objc private func signInButtonTapped() {
        let guestProfileViewController = GuestProfileViewController()
        navigationController?.pushViewController(guestProfileViewController, animated: true)
    }
}

// MARK: - setupView, setConstraints
extension BillViewController {
    private func setupView() {
        navigationItem.title = "Bill"
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(generalStackView)
        view.addSubview(totalLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            generalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            generalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Constraints.generalStackViewSideAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Constraints.generalStackViewSideAnchor)
        ])
        
        NSLayoutConstraint.activate([
            totalLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.Constraints.totalLabelBottomAnchor),
            totalLabel.trailingAnchor.constraint(equalTo: generalStackView.trailingAnchor),
            totalLabel.heightAnchor.constraint(equalToConstant: Constants.Constraints.totalLabelHeightAnchor),
            totalLabel.widthAnchor.constraint(equalToConstant: Constants.Constraints.totalLabelWidthAnchor)
        ])
    }
}
