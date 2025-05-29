//
//  DataInputView.swift
//  ListNavDemo
//
//  Created by Private on 29/05/2025.
//

import SwiftUI

struct DataInputView: View {
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var previewUserInput: String = "Sample input"
        
        var body: some View {
            DataInputView(title: "Sample title", userInput: $previewUserInput)
            Text(previewUserInput)
        }
    }
    return PreviewWrapper()
}
