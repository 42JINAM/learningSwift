//
//  ContentView.swift
//  Grocery List
//
//  Created by Private on 08/05/2025.
//

import SwiftUI
import SwiftData
import TipKit

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var item: String = ""
    @FocusState private var isFocused: Bool
    

    let buttonTip = ButtonTip()
    
    func setUpTips() {
        do {
            try Tips.resetDatastore()
            try Tips.configure([
                .displayFrequency(.immediate)
            ])
        } catch {
            print("Error resetting datastore: \(error)")
        }
    }
    init() {
        setUpTips()
    }
    
    func addEssentialFood() {
        modelContext.insert(Item(title: "Bakery & Bread", isCompleted: false))
        modelContext.insert(Item(title: "Meat & Seafood", isCompleted: false))
        modelContext.insert(Item(title: "Creal", isCompleted: false))
        modelContext.insert(Item(title: "Pasta", isCompleted: false))
    }
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
                        .swipeActions{
                            Button(role: .destructive) {
                                withAnimation {
                                    modelContext.delete(item)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .swipeActions(edge: .leading) {
                            Button("Done", systemImage: item.isCompleted == false ? "checkmark.circle" : "x.circle") {
                                item.isCompleted.toggle()
                            }
                            .tint(
                                item.isCompleted == false ? .green : .accentColor
                            )
                        }
                }
            }
            .navigationTitle(Text("Grocery List"))
            .toolbar {
                if items.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            addEssentialFood()
                        } label: {
                            Label("Essentials", systemImage: "carrot")
                        }
                        .popoverTip(buttonTip)
                    }
                }
            }
            .overlay{
                if items.isEmpty {
                    ContentUnavailableView(
                        "Empty Cart",
                        systemImage: "cart.circle",
                        description: Text("Add some items to your cart!")
                    )
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 12) {
                    TextField("", text: $item)
                        .textFieldStyle(.plain)
                        .padding(12)
                        .background(.tertiary)
                        .cornerRadius(12)
                        .font(.title.weight(.light))
                        .focused($isFocused)
                    Button {
                        guard !item.isEmpty else { return }
                        let newItem = Item(title: item, isCompleted: false)
                        modelContext.insert(newItem)
                        item = ""
                        isFocused = false
                    } label: {
                        Text("Save")
                            .font(.title2.weight(.medium))
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.extraLarge)
                }
                .padding()
                .background(.bar)
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
