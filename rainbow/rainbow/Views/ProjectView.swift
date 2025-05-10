//
//  ProjectView.swift
//  Rainbow
//
//  Created by Private on 09/05/2025.
//

import SwiftUI

struct ProjectView: View {
    @ObservedObject var project: Project
    
    
    @State var isPresented: Bool = false
    @State var newElement: String = ""
    @State var isEditing: Bool = false
    
    init(project: Project) {
        self.project = project
    }
    
    var body: some View {
        
        ZStack {
            Color(
                red: project.r,
                green: project.g,
                blue: project.b
            )
            .ignoresSafeArea(edges: .all)
            List {
                ForEach($project.elements.indices, id: \.self) { idx in
                    Group {
                        if isEditing == false {
                            Text(project.elements[idx].title)
                        } else {
                            TextField("Element type", text: $project.elements[idx].title)
                        }
                    }
                    .listRowBackground(
                        Color(
                            red: max(0, project.r - Double(idx + 1) * 0.05),
                            green: max(0, project.g - Double(idx + 1) * 0.05),
                            blue: max(0, project.b - Double(idx + 1) * 0.05)
                        )
                    )
                }
                .onDelete(perform: deleteElement)
            }
            .scrollContentBackground(.hidden)
            .navigationTitle(project.title)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.black)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(isEditing ? "Done" : "Edit") {
                        isEditing.toggle()
                    }
                    .foregroundColor(.black)
                }
            }
            .alert("new element", isPresented: $isPresented) {
                TextField("Enter a title", text: $newElement)
                Button("ADD", action: addElement)
                    .disabled(newElement.isEmpty)
            }
            
        }
    }
    func addElement() {
        let newEle = Element(title: newElement)
        project.elements.append(newEle)
        isPresented.toggle()
        newElement = ""
    }
    func deleteElement(at offsets: IndexSet) {
        project.elements.remove(atOffsets: offsets)
    }
}

//#Preview {
//    var project = Project(newTitle: "shopping")
//    ProjectView(project: $project)
//}
