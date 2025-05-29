//
//  CarDetailView.swift
//  ListNavDemo
//
//  Created by Private on 29/05/2025.
//

import SwiftUI

struct CarDetailView: View {
    let selectedCar: Car
    
    var body: some View {
        Form {
            Section("Car Details") {
                CarImageView(imageName: selectedCar.imageName)
                
                Text(selectedCar.name)
                    .font(.headline)
                Text(selectedCar.description)
                    .font(.body)
                HybridStatusView(isHybrid: selectedCar.isHybrid)
                
            }
        }
        
    }
}

#Preview {
    CarDetailView(selectedCar: carData[0])
}

struct CarImageView: View {
    let imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .cornerRadius(12.0)
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}

struct HybridStatusView: View {
    let isHybrid: Bool
    var body: some View {
        HStack {
            Text("Hybrid").font(.headline)
            Spacer()
            Image(systemName: isHybrid ? "checkmark.circle" : "xmark.circle")
        }
    }
}
