//
//  ContentView.swift
//  ListNavDemo
//
//  Created by Private on 29/05/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var carStore: CarStore = CarStore(cars: carData)
    @State private var stackPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                ForEach (0..<carStore.cars.count, id: \.self) { i in
                    NavigationLink(value: i) {
                        ListCell(car: carStore.cars[i])
                    }
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationDestination(for: Int.self) { i in
                CarDetailView(selectedCar: carStore.cars[i])
            }
            .navigationDestination(for: String.self) { _ in
                AddNewCarView(carStore: self.carStore, path: $stackPath)
            }
            
            .navigationBarTitle("EV Cars")
            .navigationBarItems(leading: NavigationLink(value: "Add Car") {
                Text("Add")
                    .foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
    func deleteItems(at offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    ContentView()
}


