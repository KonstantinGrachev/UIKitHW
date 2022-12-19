//
//  GameService.swift
//  UIKitHW
//
//  Created by Konstantin Gracheff on 19.12.2022.
//

import Foundation

protocol GameServiceProtocol: AnyObject {
    func compareNumber(number: String, completion: @escaping (String) -> Void)
}

class GameService: GameServiceProtocol {
    func compareNumber(number: String, completion: @escaping (String) -> Void) {
        guard let number = Int(number), 0...10 ~= number else {
            completion("Incorrect number")
            return
        }
        let randomNumber = Int.random(in: 0...10)
        
        let winText = """
You're win! 🎉
Your number is \(number)
Computer number is \(randomNumber)
"""
        let lostText = """
You've lost! 😐
Your number is \(number)
Computer number is \(randomNumber)
"""
        number == randomNumber ? completion(winText) : completion(lostText)
    }
}
