//
//  CoordinatorProtocol.swift
//  UIKitHW
//
//  Created by Константин Грачев on 10.01.2023.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
