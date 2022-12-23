//
//  UIStackView+Extensions.swift
//  UIKitHW
//
//  Created by Константин Грачев on 23.12.2022.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = .vertical
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
