//
//  SectionListView.swift
//  ListDemo
//
//  Created by Private on 28/05/2025.
//

import SwiftUI

struct SectionListView: View {
    @State private var toggleStatus = true
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    var body: some View {
        List {
            Section(header: Text("Settings")){
                Toggle(isOn: $toggleStatus) {
                    Text("Allow Notification")
                }
            }
            Section(header: Text("To Do Tasks")) {
                ForEach(listData) { item in
                    HStack {
                        Image(systemName: item.imageName)
                        Text(item.task)
                    }
                }
            }
        }
    }
}

#Preview {
    SectionListView()
}
