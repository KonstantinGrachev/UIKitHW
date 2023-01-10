//
//  CategoryViewController.swift
//  UIKitHW
//
//  Created by Константин Грачев on 10.01.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    init(title: String?) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
    }
}
