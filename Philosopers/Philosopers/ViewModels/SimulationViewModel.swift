//
//  File.swift
//  Philosopers
//
//  Created by Private on 27/05/2025.
//

import Foundation
@MainActor
class SimulationViewModel: ObservableObject {
    @Published var log: [String] = []
    @Published var isRunning = false
    
    private let manager = SimulationManager()
    private var monitorTask: Task<Void, Never>? = nil
    
    func startSimulation(count: Int, eatTime: TimeInterval, sleepTime: TimeInterval, survivalTime: TimeInterval) {
        Task {
            await manager
                .startSimulation(
                    count: count,
                    eatTime: eatTime,
                    sleepTime: sleepTime,
                    survivalTime: survivalTime
                )
            await MainActor.run {
                self.isRunning = true
                self.log.removeAll()
            }
            startMonitoring()
        }
    }
    
    func stopSimulation() {
        Task {
            await manager.stopSimulation()
            await MainActor.run {
                self.isRunning = false
                self.log.removeAll()
            }
            monitorTask?.cancel()
            monitorTask = nil
        }
    }
    
    private func startMonitoring() {
        monitorTask = Task {
            while await manager.isRunning() {
                let newLog = await manager.getLog()
                await MainActor.run {
                    self.log = newLog
                }
                try? await Task.sleep(nanoseconds: 200_000_000)
            }
            await MainActor.run {
                self.isRunning = false
            }
        }
    }
}
