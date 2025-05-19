//
//  StackView.swift
//  DemoProject
//
//  Created by Private on 15/05/2025.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        VStack(alignment:.center, spacing: 15) {
            Text("Financial Results")
                .font(.title)
            HStack(alignment: .top) {
                Text("Q1 Sales")
                    .font(.headline)
                Spacer()
                VStack(alignment: .leading) {
                    Text("January")
                    Text("February")
                    Text("March")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("$1000")
                    Text("$200")
                    Text("$3000")
                }
            }
            .padding()
        }
    }
}

#Preview {
    StackView()
}
