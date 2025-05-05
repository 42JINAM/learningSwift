//
//  ContentView.swift
//  HackerNews
//
//  Created by Private on 05/05/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(posts, rowContent: { post in
                Text(post.title)
            })
            .navigationBarTitle("Hacker News")
        }
    }
}

#Preview {
    ContentView()
}

struct Post: Identifiable {
    let id: String
    let title: String
}

let posts = [
    Post(id: "1", title: "Hello"),
    Post(id: "2", title: "Bonjour"),
    Post(id: "3", title: "Hola"),
]
