//
//  Philosopher.swift
//  Philosopers
//
//  Created by Private on 27/05/2025.
//

import Foundation

actor Philosopher: Identifiable {
    let id: Int
    
    private let leftFork: Fork
    private let rightFork: Fork
    private let eatTime: TimeInterval
    private let sleepTime: TimeInterval
    private let survivalTime: TimeInterval
    private let clock: SimulationClock
    private let logHandler: (String) -> Void
    private(set) var lastMealTime: Int = 0
    
    var isDead: Bool {
        let currentTime = Double(clock.secondsElapsed)
        return (currentTime - Double(lastMealTime)) > (survivalTime)
    }
    
    init(
        id: Int,
        leftFork: Fork,
        rightFork: Fork,
        eatTime: TimeInterval,
        sleepTime: TimeInterval,
        survivalTime: TimeInterval,
        clock: SimulationClock,
        logHandler: @escaping (String) -> Void
    ) {
        self.id = id
        self.leftFork = leftFork
        self.rightFork = rightFork
        self.eatTime = eatTime
        self.sleepTime = sleepTime
        self.survivalTime = survivalTime
        self.clock = clock
        self.logHandler = logHandler
    }
    
    private func log(_ message: String) {
        let time = clock.formattedTime()
        Task { @MainActor in
            logHandler("[\(time)] Philosopher \(id): \(message)")
        }
    }
    
    
    
    private func waitUnlessTooLate(duration: TimeInterval) async {
        let now = clock.secondsElapsed
        let deathTime = lastMealTime + Int(survivalTime)
        let timeLeftSec = deathTime - now
        
        if timeLeftSec <= 0 {
            return
        }
        let waitSec = duration / 1000.0
        let waitTime = min(waitSec, Double(timeLeftSec))
        let waitNs = UInt64(waitTime * 1_000_000_000)
        
        try? await Task.sleep(nanoseconds: waitNs)
    }
    
    private func getFork(fork: Fork, text: String) async -> Bool {
         while !(await fork.take()) {
            if isDead {
                return false
            }
            try? await Task.sleep(nanoseconds: 100_000_000)
        }
        log(text)
        return true
    }
    
    func start() async {
        lastMealTime = clock.secondsElapsed
        Task {
            while !isDead && !Task.isCancelled {
                await eat()
                if isDead || Task.isCancelled {
                    break
                }
                await sleep()
                if isDead || Task.isCancelled {
                    break
                }
                think()
            }
            if isDead {
                log("🪦 사망")
            }
        }
    }
    
    private func eat() async {
        if (id % 2 == 0) {
            if (await getFork(fork: leftFork, text:"🍴왼쪽 포크 획득!")) {
                if (await !getFork(fork: rightFork, text: "🍴오른쪽 포크 획득!")) {
                    await leftFork.release()
                }
            } else {
                return
            }
        } else {
            if (await getFork(fork: rightFork, text:"🍴오른쪽 포크 획득!")) {
                if (await !getFork(fork: leftFork, text: "🍴왼쪽 포크 획득!")) {
                    await rightFork.release()
                }
            } else {
                return
            }
        }
        log("🥣 먹기 시작")
        await waitUnlessTooLate(duration: eatTime)
        await leftFork.release()
        await rightFork.release()
        lastMealTime = clock.secondsElapsed
    }
        
    private func sleep() async {
        log("💤 자기 시작")
        await waitUnlessTooLate(duration: sleepTime)
    }
    private func think() {
        log("🧐 생각 시작")
    }
}
