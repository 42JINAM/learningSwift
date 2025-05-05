//
//  ContentView.swift
//  Dicer-SwiftUI
//
//  Created by Private on 05/05/2025.
//

import SwiftUI

struct ContentView: View {

    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea(edges: .all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    ExtractedView(n: leftDiceNumber)
                    ExtractedView(n: rightDiceNumber)
                }.padding(.horizontal)
                Spacer()
                Button {
                    self.leftDiceNumber = Int.random(in: 1 ... 6)
                    self.rightDiceNumber = Int.random(in: 1 ... 6)
                } label: {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
            }.padding(20)
        }
    }
}

#Preview {
    ContentView()
}

struct ExtractedView: View {
    let n:Int
    
    var body: some View {
        Image("dice\(n)").resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}
