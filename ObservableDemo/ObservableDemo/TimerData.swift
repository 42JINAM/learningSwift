//
//  TimerDate.swift
//  ObservableDemo
//
//  Created by Private on 21/05/2025.
//

import Foundation
import Combine

class TimerData: ObservableObject {
    @Published var timeCount = 0
    var timer: Timer?
    
    init() {
        timer = Timer
            .scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(timerDidFire),
                userInfo: nil,
                repeats: true
            )
    }
    @objc func timerDidFire() {
        timeCount += 1
    }
    
    func resetCount() {
        timeCount = 0
    }
}
