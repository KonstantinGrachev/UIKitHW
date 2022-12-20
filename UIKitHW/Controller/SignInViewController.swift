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
            static let specialBlueColor: UIColor = #colorLiteral(red: 0.5155287385, green: 0.665456295, blue: 0.9229761958, alpha: 1)
            static let buttonsTintColor: UIColor = .white
        }
        
        enum Constraints {
            static let stackViewSpacing: CGFloat = 10
            static let signInStackViewTopAnchor: CGFloat = 40
            static let faceIdStackViewTopAnchor: CGFloat = 20
            
            static let cornerRadius: CGFloat = 10
            
            static let appNameLabelTopAnchor: CGFloat = 10
            static let appNameLabelSideAnchors: CGFloat = 30
            static let appNameLabelHeightAnchor: CGFloat = 150
            
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
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday Reminder"
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        label.font = Constants.Fonts.appNameLabelFont
        label.textColor = Constants.Colors.specialBlueColor
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
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
        view.backgroundColor = Constants.Colors.specialBlueColor
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
        view.backgroundColor = Constants.Colors.specialBlueColor
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
    
    private lazy var secureButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        button.contentMode = .scaleAspectFit
        button.tintColor = Constants.Colors.specialBlueColor
        button.addTarget(self, action: #selector(secureButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var signInStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerLabel, emailStackView, passwordStackView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private let faceIdLabel: UILabel = {
        let label = UILabel()
        label.text = "Login by FaceID"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let faceIdSwitch: UISwitch = {
        let faceIdSwitch = UISwitch()
        faceIdSwitch.translatesAutoresizingMaskIntoConstraints = false
        return faceIdSwitch
    }()
    
    private lazy var faceIdStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [faceIdLabel, faceIdSwitch])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign in", for: .normal)
        button.titleLabel?.font = Constants.Fonts.signInButtonTitleFont
        button.backgroundColor = Constants.Colors.specialBlueColor
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
        let birthdayListViewController = BirthdayListViewController()
        navigationController?.pushViewController(birthdayListViewController, animated: true)
    }
    
    @objc private func secureButtonTapped() {
        secureButton.isSelected.toggle()
        passwordTextField.isSecureTextEntry.toggle()
    }
}

// MARK: - setupView, setConstraints
extension SignInViewController {
    private func setupView() {
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(appNameLabel)
        view.addSubview(signInStackView)
        view.addSubview(faceIdStackView)
        view.addSubview(signInButton)
        view.addSubview(secureButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            appNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Constraints.appNameLabelSideAnchors),
            appNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Constraints.appNameLabelSideAnchors),
            appNameLabel.heightAnchor.constraint(equalToConstant: Constants.Constraints.appNameLabelHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signInStackView.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: Constants.Constraints.signInStackViewTopAnchor),
            signInStackView.leadingAnchor.constraint(equalTo: appNameLabel.leadingAnchor),
            signInStackView.trailingAnchor.constraint(equalTo: appNameLabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            faceIdStackView.topAnchor.constraint(equalTo: signInStackView.bottomAnchor, constant: Constants.Constraints.faceIdStackViewTopAnchor),
            faceIdStackView.leadingAnchor.constraint(equalTo: signInStackView.leadingAnchor),
            faceIdStackView.trailingAnchor.constraint(equalTo: signInStackView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: faceIdStackView.bottomAnchor, constant: Constants.Constraints.signInButtonTopAnchor),
            signInButton.leadingAnchor.constraint(equalTo: appNameLabel.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: appNameLabel.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.signInButtonHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            secureButton.topAnchor.constraint(equalTo: passwordTextField.topAnchor),
            secureButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
            secureButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            secureButton.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor),
            secureButton.widthAnchor.constraint(equalTo: passwordTextField.heightAnchor)
        ])
    }
}
