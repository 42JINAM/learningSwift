//
//  ContentView.swift
//  Grocery List
//
//  Created by Private on 08/05/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    Text(item.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .foregroundStyle(
                            item.isCompleted == false ? Color.primary : Color
                                .accentColor)
                        .strikethrough(item.isCompleted)
                        .italic(item.isCompleted)
                }
            }
            .navigationTitle(Text("Grocery List"))
            .overlay{
                if items.isEmpty {
                    ContentUnavailableView(
                        "Empty Cart",
                        systemImage: "cart.circle",
                        description: Text("Add some items to your cart!")
                    )
                }
            }
        }
    }
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

#Preview("Sample Data") {
    let sampleData: [Item] = [
        Item(title: "Bakery & Bread", isCompleted: false),
        Item(title: "Meat & Seafood", isCompleted: true),
        Item(title: "Creal", isCompleted: .random()),
        ]
    let container = try! ModelContainer(
        for: Item.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    for item in sampleData {
        container.mainContext.insert(item)
    }
    return ContentView()
        .modelContainer(container)
}
