//
//  ListCell.swift
//  ListNavDemo
//
//  Created by Private on 29/05/2025.
//


import SwiftUI

struct ListCell: View {
    var car: Car
    var body: some View {
        HStack {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
            Text(car.name)
        }
    }
}