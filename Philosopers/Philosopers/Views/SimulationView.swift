//
//  SimulationView.swift
//  Philosopers
//
//  Created by Private on 27/05/2025.
//

import SwiftUI

struct SimulationView: View {
    @ObservedObject var viewModel: SimulationViewModel
    let onExit: () -> Void
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(
                            Array(viewModel.log.enumerated()),
                            id: \.offset
                        ) { index, entry in
                            Text(entry)
                                .font(.system(.body, design: .monospaced))
                                .padding(.vertical, 2)
                                .id(entry)
                        }
                    }
                }
                .onChange(of: viewModel.log) { _ in
                    if let last = viewModel.log.last {
                        withAnimation {
                            proxy.scrollTo(last, anchor: .bottom)
                        }
                    }
                }
            }
            Button("메인으로") {
                viewModel.stopSimulation()
                onExit()
            }
            
        }
    }
}
