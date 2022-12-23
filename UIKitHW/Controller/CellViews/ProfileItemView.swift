//
//  ProfileItemView.swift
//  UIKitHW
//
//  Created by Константин Грачев on 23.12.2022.
//

import UIKit

class ProfileItemView: UIView {
    
    enum Constants {
        enum Colors {
            static let subheaderColor: UIColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            static let divisionViewColor: UIColor = .systemGray3
        }
        
        enum Constrains {
            static let generalIndentation: CGFloat = 5
        }
    }
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.subheaderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subheaderTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        return textField
    }()
    
    private let divisionView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.divisionViewColor
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    convenience init(delegate: UITextFieldDelegate?, headerText: String?, placeholder: String?, inputView: UIView?) {
        self.init()
        self.headerLabel.text = headerText
        self.subheaderTextField.inputView = inputView
        self.subheaderTextField.placeholder = placeholder
        self.subheaderTextField.delegate = delegate
    }
    
    convenience init(delegate: UITextFieldDelegate?, headerText: String?, placeholder: String?, inputView: UIView?, inputAccessoryView: UIView?) {
        self.init()
        self.headerLabel.text = headerText
        self.subheaderTextField.inputView = inputView
        self.subheaderTextField.placeholder = placeholder
        self.subheaderTextField.inputAccessoryView = inputAccessoryView
        self.subheaderTextField.delegate = delegate
    }
    
    convenience init(target: Any?, selector: Selector, headerText: String?, placeholder: String?) {
        self.init()
        self.headerLabel.text = headerText
        self.subheaderTextField.placeholder = placeholder
        self.subheaderTextField.addTarget(target, action: selector, for: .touchDown)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: funcs
    
    func configure(with dataText: String?) {
        subheaderTextField.text = dataText
    }
}

extension ProfileItemView {
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerLabel)
        addSubview(subheaderTextField)
        addSubview(divisionView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Constrains.generalIndentation),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Constrains.generalIndentation),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Constrains.generalIndentation),
            headerLabel.bottomAnchor.constraint(equalTo: subheaderTextField.topAnchor, constant: -Constants.Constrains.generalIndentation)
        ])
        
        NSLayoutConstraint.activate([
            subheaderTextField.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            subheaderTextField.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor),
            subheaderTextField.bottomAnchor.constraint(equalTo: divisionView.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            divisionView.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            divisionView.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor),
            divisionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
