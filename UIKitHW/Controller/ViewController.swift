//
//  ViewController.swift
//  UIKitHW
//
//  Created by Konstantin Gracheff on 19.12.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: UI
    
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.font = .boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var guessNumberButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .cyan
        button.tintColor = .black
        button.setTitle("Guess the number", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(guessNumberButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var addingNumbersButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.tintColor = .black
        button.setTitle("Adding numbers", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(addingNumbersButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [guessNumberButton, addingNumbersButton])
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let resultTextView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .center
        textView.font = .systemFont(ofSize: 30)
        textView.backgroundColor = .secondarySystemBackground
        textView.layer.cornerRadius = 10
        textView.isHidden = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    //MARK: Internal properties
    
    var calculator: CalculatorServiceProtocol
    var gameService: GameServiceProtocol
    //MARK: Init
    
    init(calculator: CalculatorServiceProtocol, gameService: GameServiceProtocol) {
        self.calculator = calculator
        self.gameService = gameService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showNameAlert()
    }
    
    //MARK: setupView
    
    private func setupView() {
        view.backgroundColor = .systemTeal
        view.addSubview(greetingLabel)
        view.addSubview(buttonsStackView)
        view.addSubview(resultTextView)
    }
    
    //MARK: @objc funcs
    
    @objc private func guessNumberButtonTapped() {
        showGuessNumberAlert()
    }
    
    @objc private func addingNumbersButtonTapped() {
        showAddingAlert()
    }
}

//MARK: - showAlerts

extension ViewController {
    
    private func showNameAlert() {
        let alert = UIAlertController(title: "Hello", message: "What's your name?", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Enter your name"
            textField.textAlignment = .center
        }
        
        let ok = UIAlertAction(title: "OK", style: .default) { [weak self] action in
            guard let name = alert.textFields?.first?.text,
                  name != "" else {
                self?.showNameAlert()
                return
            }
            self?.greetingLabel.text = "Hello, \(name.capitalized)!"
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    private func showAddingAlert() {
        let alert = UIAlertController(title: "Adding numbers", message: "Enter two numbers", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Enter first number"
            textField.textAlignment = .center
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Enter second number"
            textField.textAlignment = .center
        }
        
        let ok = UIAlertAction(title: "OK", style: .default) { [weak self] action in
            guard let firstNum = alert.textFields?[0].text, firstNum != "",
                  let secondNum = alert.textFields?[1].text, secondNum != "" else {
                self?.showAddingAlert()
                return
            }
            self?.calculator.add(a: firstNum, b: secondNum) { sum in
                self?.resultTextView.text = """
\(firstNum) + \(secondNum) = \(sum)
You can try again
"""
                self?.resultTextView.isHidden = false
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    private func showGuessNumberAlert() {
        let alert = UIAlertController(title: "Guess the number", message: "Enter your number from 0 to 10", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Number"
            textField.textAlignment = .center
        }
        
        let ok = UIAlertAction(title: "OK", style: .default) { [weak self] action in
            guard let number = alert.textFields?[0].text, number != "" else {
                self?.showGuessNumberAlert()
                return
            }
            
            self?.gameService.compareNumber(number: number) { result in
                self?.resultTextView.text = result
                self?.resultTextView.isHidden = false
            }
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}

//MARK: - setConstraints

extension ViewController {
    
    enum ConstantsConstraints {
        static let greetingLabelTopAnchor: CGFloat = 20
        static let greetingLabelSideAnchor: CGFloat = 20
        static let buttonsStackViewBottomAnchor: CGFloat = 30
        static let buttonsStackViewHeightAnchorMultiplier: CGFloat = 0.6
        static let resultTextViewHeightAnchorMultiplier: CGFloat = 0.3
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: ConstantsConstraints.greetingLabelTopAnchor),
            greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsConstraints.greetingLabelSideAnchor),
            greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -ConstantsConstraints.greetingLabelSideAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -ConstantsConstraints.buttonsStackViewBottomAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: greetingLabel.trailingAnchor),
            buttonsStackView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: ConstantsConstraints.buttonsStackViewHeightAnchorMultiplier)
        ])
        
        NSLayoutConstraint.activate([
            resultTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            resultTextView.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor),
            resultTextView.trailingAnchor.constraint(equalTo: greetingLabel.trailingAnchor),
            resultTextView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: ConstantsConstraints.resultTextViewHeightAnchorMultiplier)
        ])
    }
}

