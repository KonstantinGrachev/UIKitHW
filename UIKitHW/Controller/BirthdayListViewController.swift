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
        enum Constraints {
            static let stackViewSpacing: CGFloat = 10
            static let cornerRadius: CGFloat = 10
        }
    }
    
    //MARK: UI
    private let firstUserView = BirthdayUserCellView(userHeader: "Jeremy", subHeader: "March 10, Wednesday will be 25 years old", leftDays: "18 days", userIcon: UIImage(systemName: "person.circle.fill"))
    
    private let secondUserView = BirthdayUserCellView(userHeader: "Maria Lui", subHeader: "March 30, Thursday will be 20 years old", leftDays: "28 days", userIcon: UIImage(systemName: "person.circle.fill"))
    
    private lazy var generalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstUserView,
                                                       secondUserView])
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
        present(userProfileViewController, animated: true)

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
            generalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
