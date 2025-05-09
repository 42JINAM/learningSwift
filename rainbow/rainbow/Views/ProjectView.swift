//
//  ProjectView.swift
//  Rainbow
//
//  Created by Private on 09/05/2025.
//

import SwiftUI

struct ProjectView: View {
    let title: String
    let mainColor: (r: Double, g: Double, b: Double)
    var body: some View {
        Text("hello \(title)")
    }
}

#Preview {
    ProjectView(title: "shopping", mainColor: (0, 0, 0))
}
