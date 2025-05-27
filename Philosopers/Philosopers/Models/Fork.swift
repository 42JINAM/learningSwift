//
//  Fork.swift
//  Philosopers
//
//  Created by Private on 27/05/2025.
//

import Foundation

actor Fork {
    private var isTaken = false
    
    func take() async -> Bool {
        if isTaken {
            return false
        }
        isTaken = true
        return true
    }
    func release() {
        isTaken = false
    }
}
