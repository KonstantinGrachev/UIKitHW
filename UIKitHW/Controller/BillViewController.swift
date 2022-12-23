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
            static let totalLabelColor: UIColor = #colorLiteral(red: 0.3634865582, green: 0.7221052051, blue: 0.353736043, alpha: 1)
        }
        
        enum Constraints {
            static let stackViewSpacing: CGFloat = 10
            static let cornerRadius: CGFloat = 10
            
            static let totalLabelBottomAnchor: CGFloat = 50
            static let totalLabelHeightAnchor: CGFloat = 70
            static let totalLabelWidthAnchor: CGFloat = 200
            
            static let guestProfileTextViewHeightAnchor: CGFloat = 150
        }
        
        enum Fonts {
            static let totalLabelTitleFont: UIFont = .boldSystemFont(ofSize: 16)
        }
    }
    
    //MARK: UI
    private lazy var guestProfileTextView: UITextView = {
        let textView = UITextView()
        guard let guestName = guestName,
              let guestsNumber = guestsNumber,
              let tableNumber = tableNumber else { return textView }
        textView.text = """
Name: \(guestName)
Number of guests: \(guestsNumber)
Table number: \(tableNumber)
"""
        textView.isEditable = false
        textView.textAlignment = .natural
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = Constants.Constraints.cornerRadius
        return textView
    }()
    
    private let fistDishView = OrderCellView(dishHeaderLabel: "Caesar salad",
                                             subHeader: "Tomato, Iceberg lettuce, crackers, chicken",
                                             totalSumLabel: "10$")
    
    private let secondDishView = OrderCellView(dishHeaderLabel: "Greek salad",
                                             subHeader: "Tomato, Iceberg lettuce, crackers, chicken",
                                             totalSumLabel: "20$")
    
    private lazy var generalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fistDishView, secondDishView])
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
    
    //MARK: internal properties
    
    var guestName: String?
    var tableNumber: String?
    var guestsNumber: String?
    
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
        view.addSubview(guestProfileTextView)
        view.addSubview(generalStackView)
        view.addSubview(totalLabel)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            guestProfileTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            guestProfileTextView.leadingAnchor.constraint(equalTo: generalStackView.leadingAnchor),
            guestProfileTextView.trailingAnchor.constraint(equalTo: generalStackView.trailingAnchor),
            guestProfileTextView.heightAnchor.constraint(equalToConstant: Constants.Constraints.guestProfileTextViewHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            generalStackView.topAnchor.constraint(equalTo: guestProfileTextView.bottomAnchor),
            generalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            totalLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.Constraints.totalLabelBottomAnchor),
            totalLabel.trailingAnchor.constraint(equalTo: generalStackView.trailingAnchor),
            totalLabel.heightAnchor.constraint(equalToConstant: Constants.Constraints.totalLabelHeightAnchor),
            totalLabel.widthAnchor.constraint(equalToConstant: Constants.Constraints.totalLabelWidthAnchor)
        ])
    }
}
