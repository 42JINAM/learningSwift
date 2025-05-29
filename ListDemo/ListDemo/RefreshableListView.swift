//
//  RefreshableListView.swift
//  ListDemo
//
//  Created by Private on 28/05/2025.
//

import SwiftUI

struct RefreshableListView: View {
    @State private var toggleStatus = true
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]

    var body: some View {
        List {
            Section("Setting") {
                Toggle(isOn: $toggleStatus) {
                    Text("Allow Notifications")
                }
            }
            Section("To Do Tesks") {
                ForEach(listData) { item in
                    HStack {
                        Image(systemName: item.imageName)
                        Text(item.task)
                    }
                }
            }
        }
        .refreshable {
            listData = [
                ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                ToDoItem(task: "Call financial advisor", imageName: "phone.fill"),
                ToDoItem(task: "Sell the kids", imageName: "person.2.fill")
            ]
        }
    }
}

#Preview {
    RefreshableListView()
}
