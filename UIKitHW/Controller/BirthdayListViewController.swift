//
//  BirthdayListViewController.swift
//  UIKitHW
//
//  Created by Konstantin Gracheff on 20.12.2022.
//

import UIKit

final class BirthdayListViewController: UIViewController {
    
    //MARK: Constants
    enum Constants {
        enum Colors {
            static let divisionViewColor: UIColor = .systemGray3
            static let subheaderTextColor: UIColor = .systemGray2
        }
        
        enum Constraints {
            static let stackViewSpacing: CGFloat = 10
            static let cornerRadius: CGFloat = 10
            
            static let generalStackViewSideAnchor: CGFloat = 20
                        
            static let personAvatarSize: CGFloat = 40
        }
        
        enum Fonts {
            static let headerLabelFont: UIFont = .boldSystemFont(ofSize: 20)
            static let subheaderLabelFont: UIFont = .systemFont(ofSize: 16)
            static let totalLabelTitleFont: UIFont = .boldSystemFont(ofSize: 16)
        }
    }
    
    //MARK: UI
    
    private let firstUserImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: Constants.Constraints.personAvatarSize).isActive = true
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let firstHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Jeremy"
        label.font = Constants.Fonts.headerLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstSubHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "March 10, Wednesday will be 25 years old"
        label.font = Constants.Fonts.subheaderLabelFont
        label.textColor = Constants.Colors.subheaderTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstTotalLabel: UILabel = {
        let label = UILabel()
        label.text = "18 days"
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
    
    private lazy var firstGeneralStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstUserImageView,
                                                       firstVerticalStackView
                                                      ])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private let secondUserImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        imageView.widthAnchor.constraint(equalToConstant: Constants.Constraints.personAvatarSize).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let secondHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Maria Lui"
        label.font = Constants.Fonts.headerLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondSubHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "March 30, Thursday will be 20 years old"
        label.font = Constants.Fonts.subheaderLabelFont
        label.textColor = Constants.Colors.subheaderTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondTotalLabel: UILabel = {
        let label = UILabel()
        label.text = "28 days"
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
    
    private lazy var secondGeneralStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [secondUserImageView,
                                                       secondVerticalStackView
                                                      ])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private lazy var generalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstGeneralStackView,
                                                       secondGeneralStackView
                                                      ])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setConstraints()
    }
    
    @objc private func showProfileButtonTapped() {
        let userProfileViewController = UserProfileViewController()
        navigationController?.pushViewController(userProfileViewController, animated: true)
    }
}

// MARK: - setupView, setConstraints
extension BirthdayListViewController {
    private func setupView() {
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(generalStackView)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Birthdays"
        let showProfileRightButtomItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(showProfileButtonTapped))
        navigationItem.setRightBarButton(showProfileRightButtomItem, animated: true)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            generalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            generalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Constraints.generalStackViewSideAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Constraints.generalStackViewSideAnchor)
        ])
    }
}
