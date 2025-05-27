//
//  ContentView.swift
//  Philosopers
//
//  Created by Private on 27/05/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SimulationViewModel()
    @State private var philoCount = 4
    @State private var eatTime = 200
    @State private var sleepTime = 200
    @State private var survivalTime = 410
    @State private var started = false
    
    var body: some View {
        if started {
            SimulationView(viewModel: viewModel) {
                started = false
            }
            
        } else {
            VStack {
                PhiloInputRow(label: "🙋‍♀️ 철학자들: ", value: $philoCount)
                PhiloInputRow(label: "🍝 식사시간: ", value: $eatTime)
                PhiloInputRow(label: "💤 자는시간: ", value: $sleepTime)
                PhiloInputRow(label: "⌛️ 생존시간: ", value: $survivalTime)
                Button("시작") {
                    started = true
                    viewModel
                        .startSimulation(
                            count: philoCount,
                            eatTime: TimeInterval(eatTime),
                            sleepTime: TimeInterval(sleepTime),
                            survivalTime: TimeInterval(survivalTime)
                        )
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
