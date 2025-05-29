//
//  AddNewCarView.swift
//  ListNavDemo
//
//  Created by Private on 29/05/2025.
//

import SwiftUI

struct AddNewCarView: View {
    
    @StateObject var carStore: CarStore
    @Binding var path: NavigationPath
    @State private var isHybrid = false
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            Section("Car Details") {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInputView(title: "Model", userInput: $name)
                DataInputView(title: "Description", userInput: $description)
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid").font(.headline)
                }
            }
            Button(action: addNewCar) {
                Text("Add Car")
            }
        }
    }
    func addNewCar() {
        let newCar = Car(
            id: UUID().uuidString,
            name: name,
            description: description,
            isHybrid: isHybrid,
            imageName: "tesla_model_3"
        )
        carStore.cars.append(newCar)
        path.removeLast()
    }
}
