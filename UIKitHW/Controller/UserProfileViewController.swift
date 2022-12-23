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
        
        enum Constraints {
            static let generalStackViewSpacing: CGFloat = 30
            static let userAvatarImageViewSize: CGFloat = 100
            static let generalStackViewSideAnchor: CGFloat = 20
            static let navigationActionButtonsIndentConstraints: CGFloat = 20
            static let changeAvatarButtonTopAnchor: CGFloat = 10
        }
        
        enum Fonts {
            static let navigationActionButtonsTitleFont: UIFont = .systemFont(ofSize: 16)
        }
    }
    
    //MARK: UI
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = Constants.Fonts.navigationActionButtonsTitleFont
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var addUserButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = Constants.Fonts.navigationActionButtonsTitleFont
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
    
    private lazy var nameItem = ProfileItemView(delegate: self, headerText: "Name", placeholder: "Enter name", inputView: .init())
    
    private lazy var dateItem: ProfileItemView = {
        let toolbar = UIToolbar().ToolbarPiker(mySelect: #selector(dismissDatePicker))
        let item = ProfileItemView(delegate: self, headerText: "Date", placeholder: "Enter date", inputView: datePicker, inputAccessoryView: toolbar)
        return item
    }()
    
    private lazy var ageItem = ProfileItemView(delegate: self, headerText: "Age", placeholder: "Select age", inputView: agePickerView)
    
    private lazy var sexItem = ProfileItemView(delegate: self, headerText: "Sex", placeholder: "Select sex", inputView: sexPickerView)
    
    private lazy var instagramItem = ProfileItemView(target: self, selector: #selector(instagramTextFieldTapped), headerText: "Instagram", placeholder: "Enter instagram")
    
    private lazy var generalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameItem,
                                                       dateItem,
                                                       ageItem,
                                                       sexItem,
                                                       instagramItem
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
    @objc func dismissDatePicker() {
        getDate()
        view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
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
    
    //MARK: flow funcs
    private func getDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        let date = datePicker.date
        dateItem.configure(with: dateFormatter.string(from: date))
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
            self?.instagramItem.configure(with: username)
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
            ageItem.configure(with: ageArray[row])
            view.endEditing(true)
        } else if pickerView == sexPickerView {
            sexItem.configure(with: sexArray[row])
            view.endEditing(true)
        }
    }
}

// MARK: - setupView, setConstraints
extension UserProfileViewController {
    private func setupView() {
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(generalStackView)
        view.addSubview(cancelButton)
        view.addSubview(addUserButton)
        view.addSubview(userAvatarImageView)
        view.addSubview(changeAvatarButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            generalStackView.topAnchor.constraint(equalTo: changeAvatarButton.bottomAnchor),
            generalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Constraints.navigationActionButtonsIndentConstraints),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Constraints.navigationActionButtonsIndentConstraints)
        ])
        
        NSLayoutConstraint.activate([
            addUserButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Constraints.navigationActionButtonsIndentConstraints),
            addUserButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Constraints.navigationActionButtonsIndentConstraints)
        ])
        
        NSLayoutConstraint.activate([
            userAvatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userAvatarImageView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor),
            userAvatarImageView.heightAnchor.constraint(equalToConstant: Constants.Constraints.userAvatarImageViewSize),
            userAvatarImageView.widthAnchor.constraint(equalToConstant: Constants.Constraints.userAvatarImageViewSize)
        ])
        
        NSLayoutConstraint.activate([
            changeAvatarButton.topAnchor.constraint(equalTo: userAvatarImageView.bottomAnchor, constant: Constants.Constraints.changeAvatarButtonTopAnchor),
            changeAvatarButton.centerXAnchor.constraint(equalTo: userAvatarImageView.centerXAnchor)
        ])
    }
}
