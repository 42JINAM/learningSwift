//
//  ListView.swift
//  ListDemo
//
//  Created by Private on 28/05/2025.
//

import SwiftUI

struct TextRowView: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    
}
struct TaskRowView: View {
    let systemName: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: systemName)
            Text(text)
        }
    }
}

struct ListView: View {
    var body: some View {
        List{
            Section("Section 1") {
                TextRowView(text: "Wash the car")
                    .listRowSeparator(.hidden)
                TextRowView(text: "Vaccum hourse")
                    .listRowSeparatorTint(.green)
                TextRowView(text: "Pick up kids from school bus @3pm")
                TextRowView(text: "Auction the kids on eBay")
                    .listRowBackground(Image(systemName: "circle"))
                TextRowView(text: "Order Pizza for dinner")
            }
            Section("Section 2") {
                TaskRowView(systemName: "trash.circle.fill", text: "Take out the trash")
                TaskRowView(systemName: "person.2.fill", text: "Pick up the kids")
                TaskRowView(systemName: "car.fill", text: "Wash the car")
            }
        }
    }
}

#Preview {
    ListView()
}
