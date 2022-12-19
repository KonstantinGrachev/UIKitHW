//
//  UIViewController+Extensions.swift
//  UIKitHW
//
//  Created by Константин Грачев on 19.12.2022.
//

import UIKit

extension UIViewController {
    func showAlert(title: String,
                   message: String,
                   method: @escaping ((UIAlertAction) -> Void)) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK",
                               style: .default,
                               handler: method)
        alert.addAction(ok)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
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
