//
//  ContentView.swift
//  Wishlist
//
//  Created by Private on 07/05/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    let iconName = wish.isCompleted ? "x.circle" : "checkmark.circle"
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .foregroundStyle(wish.isCompleted == false ? Color.primary : Color.gray)
                        .strikethrough(wish.isCompleted)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(wish)
                            }
                        }
                        .swipeActions(edge: .leading) {
                            Button("Done", systemImage: iconName) {
                                wish.isCompleted.toggle()
                            }
                            .tint(wish.isCompleted ? .accentColor : .green)
                        }
                }
            } //:List
            .navigationTitle(Text("Wishlist"))
         
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                    }
                 }
                if wishes.isEmpty != true {
                    ToolbarItem(placement: .bottomBar ) {
                        Text("\(wishes.count) wish\(wishes.count == 1 ? "" : "es")")
                    }
                }
            }
            .alert("Create a new wish", isPresented: $isAlertShowing){
                TextField("Enter a wish", text: $title)
                Button {
                    if title.isEmpty { return }
                    modelContext.insert(Wish(title: title))
                    title = ""
                } label: {
                    Text("Save")
                }
            }
            .emptyListOverlay(wishes)

        }
    }
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}

#Preview("List with Sample data"){
    let container = try! ModelContainer(
        for: Wish.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    container.mainContext.insert(Wish(title: "Master SwiftData"))
    container.mainContext.insert(Wish(title: "Buy a new iphone"))
    container.mainContext.insert(Wish(title: "practice latin dances"))
    container.mainContext.insert(Wish(title: "Travel to Europe"))
    container.mainContext.insert(Wish(title: "Make a positive impact"))

    return ContentView().modelContainer(container)
}
