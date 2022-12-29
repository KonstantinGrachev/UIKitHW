//
//  Float+Extensions.swift
//  UIKitHW
//
//  Created by Константин Грачев on 29.12.2022.
//

import Foundation

extension Float {
    
    func convertSeconds() -> (Int, Int) {
        let min = Int(self) / 60
        let sec = Int(self) % 60
        return (min, sec)
    }
}
