//
//  Int+Extensions.swift
//  UIKitHW
//
//  Created by Константин Грачев on 29.12.2022.
//

import Foundation
//
extension Int {
    func setZeroForSecond() -> String {
        return (Double(self) / 10.0 < 1 ? "0\(self)" : "\(self)")
    }
}
