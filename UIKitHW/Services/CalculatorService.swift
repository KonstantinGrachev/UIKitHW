//
//  CalculatorService.swift
//  UIKitHW
//
//  Created by Konstantin Gracheff on 19.12.2022.
//

import Foundation

protocol CalculatorServiceProtocol: AnyObject {
    func add(a: String, b: String, completion: @escaping (Int) -> Void)
}

class CalculatorService: CalculatorServiceProtocol {
    func add(a: String, b: String, completion: @escaping (Int) -> Void) {
        guard let a = Int(a),
              let b = Int(b) else { return }
        let sum = a + b
        completion(sum)
    }
    
}
