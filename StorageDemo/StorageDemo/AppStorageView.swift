//
//  AppStorageView.swift
//  StorageDemo
//
//  Created by Private on 22/05/2025.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("mytext") var editorText: String = "Sample text"
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

#Preview {
    AppStorageView()
}
