//
//  UIViewController+Extensions.swift
//  UIKitHW
//
//  Created by Konstantin Gracheff on 20.12.2022.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK",
                               style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
