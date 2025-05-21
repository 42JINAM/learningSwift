//
//  ActorView.swift
//  ConcurrencyDemo
//
//  Created by Private on 20/05/2025.
//

import SwiftUI

struct ActorView: View {
    var body: some View {
        Button(action: {
        Task {
                await someFunction()
            }
        }){
            Text("Do something")
        }

    }
    func someFunction() async {
        let builder = BuildMessage()
        await builder.setName(name: "Jane Smith")
        let message = await builder.message
        print(message)
    }
}

#Preview {
    ActorView()
}
