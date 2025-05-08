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
    @FocusState private var isFocused: Bool
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    let iconName = wish.isCompleted ? "x.circle" : "checkmark.circle"
                    Text(wish.title)
                        .font(.system(size: 15))
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
//            .alert("Create a new wish", isPresented: $isAlertShowing){
//                TextField("Enter a wish", text: $title)
//                Button {
//                    if title.isEmpty { return }
//                    modelContext.insert(Wish(title: title))
//                    title = ""
//                } label: {
//                    Text("Save")
//                }
//            }
            .emptyListOverlay(wishes)
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 12) {
                    TextField("Enter a wish", text: $title)
                        .textFieldStyle(.plain)
                        .padding(12)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                        .font(.title.weight(.light))
                        .focused($isFocused)
                    Button {
                        if title.isEmpty { return }
                        modelContext.insert(Wish(title: title))
                        title = ""
                        isFocused = false
                    } label: {
                        Text("Save")
                            .font(.title2.weight(.medium))
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.large)
                }
                .padding()
                .background(.bar)
            }
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
