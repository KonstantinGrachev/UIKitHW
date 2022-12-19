//
//  ViewController.swift
//  UIKitHW
//
//  Created by Konstantin Gracheff on 19.12.2022.
//

import UIKit

final class SignInViewController: UIViewController {

    //MARK: Constants
    enum Constants {
        enum Colors {
            static let appIconColor: UIColor = .systemGray3
            static let buttonsBackgroundColor: UIColor = #colorLiteral(red: 0.9676821828, green: 0.3722274303, blue: 0.4165475965, alpha: 1)
            static let buttonsTintColor: UIColor = .white
        }
        
        enum Constraints {
            static let stackViewSpacing: CGFloat = 10
            static let signInStackViewTopAnchor: CGFloat = 40
            
            static let cornerRadius: CGFloat = 10
            
            static let appIconImageViewSideAnchors: CGFloat = 40
            static let appIconImageViewHeightAnchor: CGFloat = 150
            
            static let appNameLabelTopAnchor: CGFloat = 10
            
            static let signInButtonHeightAnchor: CGFloat = 70
            static let signInButtonTopAnchor: CGFloat = 40
        }
        
        enum Fonts {
            static let appNameLabelFont: UIFont = .boldSystemFont(ofSize: 20)
            static let signInButtonTitleFont: UIFont = .boldSystemFont(ofSize: 16)
            static let headerLabelFont: UIFont = .boldSystemFont(ofSize: 36)
        }
    }
    
    //MARK: UI
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cloud.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Constants.Colors.appIconColor
        return imageView
    }()
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Company Apple"
        label.font = Constants.Fonts.appNameLabelFont
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.textColor = Constants.Colors.appIconColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.headerLabelFont
        label.text = "Sign In"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailSubHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        return textField
    }()
    
    private let emailDivisionView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.appIconColor
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailSubHeaderLabel, emailTextField, emailDivisionView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private let passwordSubHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.borderStyle = .none
        return textField
    }()
    
    private let passwordDivisionView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.appIconColor
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passwordSubHeaderLabel, passwordTextField, passwordDivisionView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private lazy var signInStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerLabel, emailStackView, passwordStackView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign in", for: .normal)
        button.titleLabel?.font = Constants.Fonts.signInButtonTitleFont
        button.backgroundColor = Constants.Colors.buttonsBackgroundColor
        button.tintColor = Constants.Colors.buttonsTintColor
        button.layer.cornerRadius = Constants.Constraints.cornerRadius
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
extension SignInViewController {
    private func setupView() {
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(appIconImageView)
        view.addSubview(appNameLabel)
        view.addSubview(signInStackView)
        view.addSubview(signInButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            appIconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appIconImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Constraints.appIconImageViewSideAnchors),
            appIconImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Constraints.appIconImageViewSideAnchors),
            appIconImageView.heightAnchor.constraint(equalToConstant: Constants.Constraints.appIconImageViewHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            appNameLabel.topAnchor.constraint(equalTo: appIconImageView.bottomAnchor, constant: Constants.Constraints.appNameLabelTopAnchor),
            appNameLabel.leadingAnchor.constraint(equalTo: appIconImageView.leadingAnchor),
            appNameLabel.trailingAnchor.constraint(equalTo: appIconImageView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signInStackView.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: Constants.Constraints.signInStackViewTopAnchor),
            signInStackView.leadingAnchor.constraint(equalTo: appNameLabel.leadingAnchor),
            signInStackView.trailingAnchor.constraint(equalTo: appNameLabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: signInStackView.bottomAnchor, constant: Constants.Constraints.signInButtonTopAnchor),
            signInButton.leadingAnchor.constraint(equalTo: appNameLabel.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: appNameLabel.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.signInButtonHeightAnchor)
        ])
    }
}
