//
//  StackPathView.swift
//  ListDemo
//
//  Created by Private on 28/05/2025.
//

import SwiftUI

struct EditableListView: View {
    @State private var stackPath = NavigationPath()
    @State private var toggleStatus = true
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                Section("Setting") {
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notifications")
                    }
                    NavigationLink(value: listData.count) {
                        Text("View Task Count")
                    }
                }
                Section("To Do Tesks") {
                    ForEach(listData) { item in
                        NavigationLink(value: item.task) {
                            HStack {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
            }
            .navigationTitle("My Stacks")
            .navigationDestination(for: String.self) { task in
                VStack {
                    Text("Selected task = \(task)")
                        .font(.title)
                    Button("Go to Root view") {
                        stackPath.removeLast(stackPath.count)
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                    NavigationLink("Go deeper (Another String)", value: "Another Detail from \(task)")
                    NavigationLink("Go Deeper (Int)", value: 12345)
                }
            }
            .navigationDestination(for: Int.self) { count in
                Text("Number of tasks = \(count)")
            }
            .refreshable {
                listData = [
                    ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                    ToDoItem(task: "Call financial advisor", imageName: "phone.fill"),
                    ToDoItem(task: "Sell the kids", imageName: "person.2.fill")
                ]
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                    Button {
                        let newItem = ToDoItem(task: "New Task \(listData.count + 1)", imageName: "plus.circle.fill")
                        listData.append(newItem)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    func deleteItem(at offsets: IndexSet) {
        listData.remove(atOffsets: offsets)
    }
    func moveItem(from source: IndexSet, to destination: Int) {
        listData.move(fromOffsets: source, toOffset: destination)
    }
}


#Preview {
    EditableListView()
}
