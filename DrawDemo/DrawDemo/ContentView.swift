//
//  ContentView.swift
//  DrawDemo
//
//  Created by Private on 02/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            Circle()
                .stroke(lineWidth: 20)
                .fill(.red)
                .frame(width: 200, height: 200)
            Capsule()
                .stroke(lineWidth: 10)
                .foregroundColor(.blue)
                .frame(width: 200, height: 100)
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 8, dash: [CGFloat(10)]))
                .frame(width: 200, height: 100)
            Ellipse()
                .stroke(
                    style: StrokeStyle(
                        lineWidth: 20,
                        dash: [CGFloat(10), CGFloat(5), CGFloat(2)],
                        dashPhase: CGFloat(10)
                        
                    )
                )
                .frame(width: 250, height: 150)
            Ellipse()
                .fill(.red)
                .overlay(
                    Ellipse()
                        .stroke(.blue, lineWidth: 10)
                )
                .frame(width: 250, height: 150)
            
        }
    }
}

#Preview {
    ContentView()
}
