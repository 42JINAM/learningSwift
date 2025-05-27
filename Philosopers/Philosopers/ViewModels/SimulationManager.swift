//
//  SimulationManager.swift
//  Philosopers
//
//  Created by Private on 27/05/2025.
//

import Foundation

actor SimulationManager {
    var philosophers: [Philosopher] = []
    var philosopherTasks: [Task<Void, Never>] = []
    var forks: [Fork] = []
    let clock = SimulationClock()
    var log: [String] = []
    private var isSimulationRunning = true
    
    func appendlog(_ entry: String) {
        log.append(entry)
    }
    
    func startSimulation(count: Int, eatTime: TimeInterval, sleepTime: TimeInterval, survivalTime: TimeInterval) {
        isSimulationRunning = true
        let forks = (0..<count).map {_ in Fork()}
        philosophers = (0..<count).map { i in
            Philosopher(
                id: i,
                leftFork: forks[i],
                rightFork: forks[(i + 1) % count],
                eatTime: eatTime,
                sleepTime: sleepTime,
                survivalTime: survivalTime,
                clock: clock,
                logHandler: { [weak self] entry in
                    Task { await self?.appendlog(entry)}
                }
            )
        }
        clock.start()
        
        philosopherTasks = philosophers.map { philosopher in
            Task {
                await philosopher.start()
            }
        }
    }
    
    func getLog() -> [String] {
        return log
    }
    
    func isRunning() -> Bool {
        return isSimulationRunning
    }
    
    func stopSimulation() {
        isSimulationRunning = false
        philosopherTasks.forEach { $0.cancel()}
        philosopherTasks.removeAll()
    }
    func monitorForDeath() {
        Task {
            while isSimulationRunning {
                for philosopher in philosophers {
                    if await philosopher.isDead {
                        stopSimulation()
                        break
                    }
                }
                try? await Task.sleep(nanoseconds: 200_000_000)
            }
            for task in philosopherTasks {
                task.cancel()
            }
            
        }
    }
}
