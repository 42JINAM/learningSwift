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
    
    func addPet(){
        let pet = Pet(name: "Best Friend")
        modelContext.insert(pet)
    }
    
    let layout = [
        GridItem(.flexible(minimum: 120)),
        GridItem(.flexible(minimum: 120)),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: layout) {
                    GridRow {
                        ForEach(pets) { pet in
                            NavigationLink(destination: EmptyView()) {
                                VStack {
                                    if let imageData = pet.photo {
                                        if let image = UIImage(data: imageData) {
                                            Image(uiImage: image)
                                        }
                                    } else {
                                        Image(systemName: "pawprint.circle")
                                            .resizable()
                                            .scaledToFit()
                                            .padding(40)
                                            .foregroundStyle(.quaternary)
                                    }
                                    Spacer()
                                    Text(pet.name)
                                        .font(.title.weight(.light))
                                        .padding(.vertical)
                                    Spacer()
                                }
                                .frame(
                                    minWidth: 0,
                                    maxWidth: .infinity,
                                    minHeight: 0,
                                    maxHeight: .infinity,
                                )
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                            }
                            .foregroundStyle(.primary)
                        }
                    } //Grid row
                    
                } // Grid layout
                .padding(.horizontal)
            } // scrollview
            .navigationTitle(pets.isEmpty ? "" : "Paws")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add a New Pet", systemImage: "plus.circle", action: addPet)
                }
            }
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

#Preview("Sample data") {
    ContentView()
        .modelContainer(Pet.preview)
}
