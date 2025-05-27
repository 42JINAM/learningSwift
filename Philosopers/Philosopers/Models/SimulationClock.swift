//
//  SimulationClock.swift
//  Philosopers
//
//  Created by Private on 27/05/2025.
//

import Foundation

@Observable
class SimulationClock {
    private(set) var secondsElapsed: Int = 0
    
    func start() {
        Task {
            while true {
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                secondsElapsed += 1
            }
        }
    }
    
    func formattedTime() -> String {
        "\(secondsElapsed)"
    }
    
}
