//
//  ProjectView.swift
//  Rainbow
//
//  Created by Private on 09/05/2025.
//

import SwiftUI

struct ProjectView: View {
    @Binding var project: Project
    
    @State var isPresented: Bool = false
    @State var newElement: String = ""
    
    var body: some View {
        ZStack {
           
        }

    }
    func addElement() {
        let newElement = Element(title: newElement)
        project.elements.append(newElement)
        isPresented.toggle()
    }
}

//#Preview {
//    var project = Project(newTitle: "shopping")
//    ProjectView(project: $project)
//}
