//
//  ViewController.swift
//  UIKitHW
//
//  Created by Konstantin Gracheff on 19.12.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    enum Constants {
        static let sizeButton: CGFloat = 100
    }
    //MARK: UI
    private let greetLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var greetModel = GreetModel()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = Constants.sizeButton / 2
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    //MARK: @objc funcs

    @objc private func startButtonTapped() {
        greetLabel.text = ""
        greetLabel.isHidden = true
        showAlert()
    }
    
    //MARK: flow funcs
    
    private func showAlert() {
        let alert = UIAlertController(title: "Hi!", message: """
Enter characters
h e l l o
in different order
""", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { [weak self] action in
            guard let text = alert.textFields?.first?.text else { return }
            self?.greetModel.greet = text.lowercased()
            self?.greetLabel.isHidden = false
            self?.greetLabel.text = self?.greetModel.correctGreet()
        }
        
        alert.addTextField { textfield in
            textfield.placeholder = "For example: lelho"
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
}

//MARK: setupView – setConstraints

extension ViewController {
    private func setupView() {
        view.backgroundColor = .systemTeal
        view.addSubview(greetLabel)
        view.addSubview(startButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            greetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: greetLabel.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.sizeButton),
            startButton.heightAnchor.constraint(equalToConstant: Constants.sizeButton),
            startButton.widthAnchor.constraint(equalToConstant: Constants.sizeButton)
        ])
    }
}
