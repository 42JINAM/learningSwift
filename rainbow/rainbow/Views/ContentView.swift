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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(projects) { project in
                        NavigationLink(project.title) {
                            ProjectView(
                                title: project.title,
                                mainColor: project.getMainColor())
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Rainbow")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .alert("new project", isPresented: $isPresented) {
                TextField("Enter a title", text: $newProjectTitle)
                Button("ADD", action: addProject)
                    .disabled(newProjectTitle.isEmpty)

            }
        }
    }
    func addProject() {
        let newProject = Project(newTitle: newProjectTitle)
        projects.append(newProject)
        newProjectTitle = ""
    }
}

#Preview {
    ContentView()
}
