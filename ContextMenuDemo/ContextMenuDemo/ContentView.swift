//
//  ContentView.swift
//  ContextMenuDemo
//
//  Created by Private on 02/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var foregroundColor: Color = Color.black
    @State private var backgroundColor: Color = Color.white
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .padding()
                .font(.largeTitle)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .contextMenu {
                    Button(action: {
                        self.foregroundColor = .black
                        self.backgroundColor = .white
                        
                    }) {
                        Text("Normal Colors")
                        Image(systemName: "paintBrush")
                    }
                    Button(action: {
                        self.foregroundColor = .white
                        self.backgroundColor = .black
                        
                    }) {
                        Text("Inverted Colors")
                        Image(systemName: "paintbrush.fill")
                    }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
