//
//  UserProfileViewController.swift
//  UIKitHW
//
//  Created by Konstantin Gracheff on 20.12.2022.
//

import UIKit

final class UserProfileViewController: UIViewController {
    
    //MARK: Constants
    enum Constants {
        enum Colors {
            static let subheaderColor: UIColor = #colorLiteral(red: 0.714525044, green: 0.8055147529, blue: 0.9428887367, alpha: 1)
            static let divisionViewColor: UIColor = .systemGray3
        }
        
        enum Constraints {
            static let stackViewSpacing: CGFloat = 10
            static let generalStackViewSpacing: CGFloat = 50
            static let userAvatarImageViewSize: CGFloat = 100
            static let generalStackViewSideAnchor: CGFloat = 20
        }
    }
    
    //MARK: UI
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let userAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemGray
        imageView.layer.cornerRadius = Constants.Constraints.userAvatarImageViewSize / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var changeAvatarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change photo", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(changeAvatarButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let nameSubHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = Constants.Colors.subheaderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        return textField
    }()
    
    private let nameDivisionView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.divisionViewColor
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameSubHeaderLabel,
                                                       nameTextField,
                                                       nameDivisionView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private lazy var generalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameStackView
                                                      ])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.generalStackViewSpacing
        return stackView
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    //MARK: @objc funcs
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func addButtonTapped() {
        dismiss(animated: true) {
            print("User added")
        }
    }
    
    @objc private func changeAvatarButtonTapped() {
        showImagePicker()
    }
    
    //MARK: flow funcs
    private func showImagePicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
}

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension UserProfileViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            var chosenImage = UIImage()
            if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                chosenImage = image
            } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                chosenImage = image
            }
            userAvatarImageView.image = chosenImage
            picker.dismiss(animated: true)
        }
}

// MARK: - setupView, setConstraints
extension UserProfileViewController {
    private func setupView() {
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(generalStackView)
        view.addSubview(cancelButton)
        view.addSubview(addButton)
        view.addSubview(userAvatarImageView)
        view.addSubview(changeAvatarButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            generalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            generalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Constraints.generalStackViewSideAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Constraints.generalStackViewSideAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            userAvatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userAvatarImageView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor),
            userAvatarImageView.heightAnchor.constraint(equalToConstant: Constants.Constraints.userAvatarImageViewSize),
            userAvatarImageView.widthAnchor.constraint(equalToConstant: Constants.Constraints.userAvatarImageViewSize)
        ])
        
        NSLayoutConstraint.activate([
            changeAvatarButton.topAnchor.constraint(equalTo: userAvatarImageView.bottomAnchor, constant: 10),
            changeAvatarButton.centerXAnchor.constraint(equalTo: userAvatarImageView.centerXAnchor)
        ])
    }
}
