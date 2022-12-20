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
            static let subheaderColor: UIColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            static let divisionViewColor: UIColor = .systemGray3
        }
        
        enum Constraints {
            static let stackViewSpacing: CGFloat = 10
            static let generalStackViewSpacing: CGFloat = 30
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
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.delegate = self
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
    
    private let dateSubHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.textColor = Constants.Colors.subheaderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter date"
        textField.inputView = datePicker
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        return textField
    }()
    
    private let dateDivisionView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.divisionViewColor
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dateSubHeaderLabel,
                                                       dateTextField,
                                                       dateDivisionView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private let ageSubHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.textColor = Constants.Colors.subheaderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Select age"
        textField.inputView = agePickerView
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        return textField
    }()
    
    private let ageDivisionView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.divisionViewColor
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var ageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ageSubHeaderLabel,
                                                       ageTextField,
                                                       ageDivisionView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private let sexSubHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Sex"
        label.textColor = Constants.Colors.subheaderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sexTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Select sex"
        textField.inputView = sexPickerView
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        return textField
    }()
    
    private let sexDivisionView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.divisionViewColor
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sexStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sexSubHeaderLabel,
                                                       sexTextField,
                                                       sexDivisionView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private let instagramSubHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram"
        label.textColor = Constants.Colors.subheaderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var instagramTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter instagram"
        textField.addTarget(self, action: #selector(instagramTextFieldTapped), for: .touchDown)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        return textField
    }()
    
    private let instagramDivisionView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.divisionViewColor
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var instagramStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [instagramSubHeaderLabel,
                                                       instagramTextField,
                                                       instagramDivisionView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private lazy var generalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameStackView,
                                                       dateStackView,
                                                       ageStackView,
                                                       sexStackView,
                                                       instagramStackView
                                                      ])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.generalStackViewSpacing
        return stackView
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        return datePicker
    }()
    
    private lazy var agePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    
    private lazy var sexPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    
    //MARK: private properties
    private var sexArray = ["Male", "Female"]
    private var ageArray = (1...100).map(String.init)
    
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
    
    @objc private func instagramTextFieldTapped() {
        showInstAlert()
    }
    
    @objc private func datePickerValueChanged() {
        getDate()
    }
    
    //MARK: flow funcs
    private func getDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        let date = datePicker.date
        
        dateTextField.text = dateFormatter.string(from: date)
    }
    private func showImagePicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    private func showInstAlert() {
        let alert = UIAlertController(title: "Instagram", message: "Enter your username", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "@username"
        }
        let ok = UIAlertAction(title: "OK", style: .default) { [weak self] action in
            guard let username = alert.textFields?.first?.text else { return }
            self?.instagramTextField.text = username
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancel)
        print("alert")
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension UserProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    func hideKeyboard() {
        view.endEditing(true)
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

extension UserProfileViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == sexPickerView {
            return sexArray.count
        } else if pickerView == agePickerView {
            return ageArray.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == sexPickerView {
            return sexArray[row]
        } else if pickerView == agePickerView {
            return ageArray[row]
        } else {
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == agePickerView {
            ageTextField.text = ageArray[row]
            ageTextField.resignFirstResponder()
        } else if pickerView == sexPickerView {
            sexTextField.text = sexArray[row]
            sexTextField.resignFirstResponder()
        }
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
            generalStackView.topAnchor.constraint(equalTo: changeAvatarButton.bottomAnchor),
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
