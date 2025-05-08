//
//  ContentView.swift
//  Pow
//
//  Created by Private on 08/05/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var pets: [Pet]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
            } // scrollview
            .overlay {
                if pets.isEmpty {
                    CustomContentUnavailableView(
                        icon: "dog.circle",
                        title: "No pets found",
                        description: "Add a new pat to get started"
                    )
                }
            }
        } // navigationStack
    }
}

#Preview("No data") {
    ContentView()
        .modelContainer(for: Pet.self, inMemory: true)
}

#Preview {
    ContentView()
}
