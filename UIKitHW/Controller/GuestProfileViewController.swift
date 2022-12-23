//
//  GuestProfileViewController.swift
//  UIKitHW
//
//  Created by Константин Грачев on 19.12.2022.
//

import UIKit

final class GuestProfileViewController: UIViewController {
    
    //MARK: Constants
    enum Constants {
        enum Colors {
            static let buttonsBackgroundColor: UIColor = #colorLiteral(red: 0.9676821828, green: 0.3722274303, blue: 0.4165475965, alpha: 1)
            static let subheaderColor: UIColor = #colorLiteral(red: 0.9676821828, green: 0.3722274303, blue: 0.4165475965, alpha: 1)
            static let buttonsTintColor: UIColor = .white
            static let divisionViewColor: UIColor = .systemGray3
        }
        
        enum Constraints {
            static let stackViewSpacing: CGFloat = 10
            static let generalStackViewSpacing: CGFloat = 50
            static let generalStackViewSideAnchor: CGFloat = 20
            
            static let cornerRadius: CGFloat = 10
                        
            static let billButtonHeightAnchor: CGFloat = 70
            static let billButtonTopAnchor: CGFloat = 40
        }
        
        enum Fonts {
            static let billButtonTitleFont: UIFont = .boldSystemFont(ofSize: 16)
            
        }
    }
    
    //MARK: UI
    private let guestNameSubHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = Constants.Colors.subheaderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let guestNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        return textField
    }()
    
    private let guestNameDivisionView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.divisionViewColor
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var guestNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [guestNameSubHeaderLabel,
                                                       guestNameTextField,
                                                       guestNameDivisionView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private let guestsNumberSubHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Number of guests"
        label.textColor = Constants.Colors.subheaderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let guestsNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter number"
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        return textField
    }()
    
    private let guestsNumberDivisionView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.divisionViewColor
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var guestsNumberStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [guestsNumberSubHeaderLabel,
                                                       guestsNumberTextField,
                                                       guestsNumberDivisionView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private let tableNumberSubHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Table number"
        label.textColor = Constants.Colors.subheaderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter number"
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        return textField
    }()
    
    private let tableNumberDivisionView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.divisionViewColor
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableNumberStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tableNumberSubHeaderLabel,
                                                       tableNumberTextField,
                                                       tableNumberDivisionView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private lazy var textfieldsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [guestNameStackView,
                                                       guestsNumberStackView,
                                                       tableNumberStackView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private let bookedLabel: UILabel = {
        let label = UILabel()
        label.text = "Is booked a table?"
        label.textColor = Constants.Colors.subheaderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bookedSwitch: UISwitch = {
        let bookedSwitch = UISwitch()
        bookedSwitch.translatesAutoresizingMaskIntoConstraints = false
        return bookedSwitch
    }()
    
    private lazy var bookedSwitchStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [bookedLabel,
                                                       bookedSwitch])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private let prepaymentLabel: UILabel = {
        let label = UILabel()
        label.text = "Prepayment?"
        label.textColor = Constants.Colors.subheaderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let prepaymentSwitch: UISwitch = {
        let bookedSwitch = UISwitch()
        bookedSwitch.translatesAutoresizingMaskIntoConstraints = false
        return bookedSwitch
    }()
    
    private lazy var prepaymentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [prepaymentLabel,
                                                       prepaymentSwitch])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private let vipLabel: UILabel = {
        let label = UILabel()
        label.text = "Is VIP room?"
        label.textColor = Constants.Colors.subheaderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let vipSwitch: UISwitch = {
        let bookedSwitch = UISwitch()
        bookedSwitch.translatesAutoresizingMaskIntoConstraints = false
        return bookedSwitch
    }()
    
    private lazy var vipStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [vipLabel,
                                                       vipSwitch])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private lazy var switchStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [bookedSwitchStackView,
                                                       prepaymentStackView,
                                                       vipStackView
                                                      ])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.stackViewSpacing
        return stackView
    }()
    
    private lazy var generalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textfieldsStackView,
                                                       switchStackView
                                                      ])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.Constraints.generalStackViewSpacing
        return stackView
    }()
    
    private lazy var billButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Bill", for: .normal)
        button.titleLabel?.font = Constants.Fonts.billButtonTitleFont
        button.backgroundColor = Constants.Colors.buttonsBackgroundColor
        button.tintColor = Constants.Colors.buttonsTintColor
        button.layer.cornerRadius = Constants.Constraints.cornerRadius
        button.addTarget(self, action: #selector(billButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    //MARK: flow funcs
    private func isTextFieldsEmpty() -> Bool {
        if guestNameTextField.text == "",
           guestsNumberTextField.text == "",
           tableNumberTextField.text == "" {
            return true
        }
        
        return false
    }
    
    private func pushBillScreen() {
        if !isTextFieldsEmpty() {
            showAlert(title: "Bill", message: "Bill for the table?") { [weak self] _ in
                let billViewController = BillViewController()
                billViewController.guestName = self?.guestNameTextField.text?.capitalized
                billViewController.guestsNumber = self?.guestsNumberTextField.text
                billViewController.tableNumber = self?.tableNumberTextField.text
                self?.navigationController?.pushViewController(billViewController, animated: true)
            }
        } else {
            showAlert(title: "Error", message: "Fill in all the fields")
        }
    }

    //MARK: @objc funcs
    @objc private func billButtonTapped() {
        pushBillScreen()
    }
}

// MARK: - setupView, setConstraints
extension GuestProfileViewController {
    private func setupView() {
        navigationItem.title = "Cafe Mario"
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(generalStackView)
        view.addSubview(billButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            generalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            generalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Constraints.generalStackViewSideAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Constraints.generalStackViewSideAnchor)
        ])
        
        NSLayoutConstraint.activate([
            billButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            billButton.leadingAnchor.constraint(equalTo: generalStackView.leadingAnchor),
            billButton.trailingAnchor.constraint(equalTo: generalStackView.trailingAnchor),
            billButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.billButtonHeightAnchor)
        ])
    }
}
