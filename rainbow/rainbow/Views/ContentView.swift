//
//  ContentView.swift
//  Rainbow
//
//  Created by Private on 09/05/2025.
//

import SwiftUI

struct ContentView: View {
    @State var projects: [Project] = []
    @State var isPresented: Bool = false
    @State var newProjectTitle: String = ""
    @State var isEditing: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("rainbow")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                List {
                    ForEach($projects, id: \.id) {$project in
                        Group {
                            if isEditing == false {
                                NavigationLink {
                                    ProjectView(project: project)
                                } label: {
                                    Text(project.title)
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .padding(.leading, 12)
                                }
                                .buttonStyle(PlainButtonStyle())
                            } else {
                                TextField("Project Title", text: $project.title)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .padding(.leading, 12)
                            }
                        }
                        .padding()
                        .listRowInsets(EdgeInsets(top: 1, leading: 10, bottom: 1, trailing: 10))
                        .listRowBackground(
                            Color(
                                red:  project.r,
                                green: project.g,
                                blue: project.b
                            )
                        )
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                    }
                    .onDelete(perform: deleteProject)

                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Rainbow")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isPresented.toggle()
                        } label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.black)
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button(isEditing ? "Done" : "Edit") {
                            isEditing.toggle()
                        }
                        .foregroundColor(.white)
                    }
                }
                .alert("new project", isPresented: $isPresented) {
                    TextField("Enter a title", text: $newProjectTitle)
                    Button("ADD", action: addProject)
                        .disabled(newProjectTitle.isEmpty)
                    
                }
            }

        }
    }
    func addProject() {
        let newProject = Project(newTitle: newProjectTitle)
        projects.append(newProject)
        newProjectTitle = ""
    }
    func deleteProject(at offsets: IndexSet) {
        projects.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
