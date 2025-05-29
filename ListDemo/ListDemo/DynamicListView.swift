//
//  DynamicListView.swift
//  ListDemo
//
//  Created by Private on 28/05/2025.
//

import SwiftUI

struct DynamicListView: View {
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    var body: some View {
        List(listData) { item in
            HStack {
                Image(systemName: item.imageName)
                Text(item.task)
            }
        }
    }
}

#Preview {
    DynamicListView()
}
