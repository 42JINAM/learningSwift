//
//  SecondTabView.swift
//  LifecycleDemo
//
//  Created by Private on 21/05/2025.
//

import SwiftUI

struct SecondTabView: View {
    @State private var text: String = ""
    
    var body: some View {
        TextEditor(text: $text)
            .padding()
            .onChange(of: text){
                print("onChange triggered")
            }
    }
}

#Preview {
    SecondTabView()
}
