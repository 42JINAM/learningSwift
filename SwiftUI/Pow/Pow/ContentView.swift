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
    }
}

#Preview("No data") {
    ContentView()
        .modelContainer(for: Pet.self, inMemory: true)
}

#Preview {
    ContentView()
}
