//
//  BuildMessage.swift
//  ConcurrencyDemo
//
//  Created by Private on 20/05/2025.
//

import Foundation

actor BuildMessage {
    var message: String = ""
    let greeting = "Hello"
    
    func setName(name: String) {
        self.message = "\(greeting) \(name)"
    }
    
    nonisolated func getGreeting() -> String {
        return greeting
    }
}
