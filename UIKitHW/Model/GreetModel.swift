//
//  GreetModel.swift
//  UIKitHW
//
//  Created by Константин Грачев on 19.12.2022.
//

import Foundation

struct GreetModel {
    var greet = String()
    
    mutating func correctGreet() -> String {
        var string = String()
        let helloString = "hello"
        
        if greet.count != helloString.count { return "Error" }
        
        while string != helloString {
            for i in 0..<helloString.count {
                let i = helloString.index(helloString.startIndex, offsetBy: i)
                for j in 0..<helloString.count {
                    if j == helloString.count - 1 {
                        break
                    }
                    let j = helloString.index(helloString.startIndex, offsetBy: j)
                    if self.greet[j] == helloString[i] {
                        string.append(greet[j])
                    }
                }
            }
        }
        return string
    }
}
