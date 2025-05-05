//
//  ContentView.swift
//  JinamCard
//
//  Created by Private on 05/05/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 231/255.0, green: 76/255.0, blue: 60/255.0)
                .ignoresSafeArea(edges: .all)
            VStack {
                Image("jinam")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                Text("Jihee Nam")
                    .font(Font.custom("Pacifico-Regular", size:40))
                    .bold(true)
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                InfoView(text: "+33 12 34 56", imageName: "phone.fill")
                InfoView(text: "jinam@gmail.com", imageName: "envelope.fill")
            }
            
        }
    }
}

#Preview {
    ContentView()
}

