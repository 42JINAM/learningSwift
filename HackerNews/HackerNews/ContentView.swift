//
//  ContentView.swift
//  HackerNews
//
//  Created by Private on 05/05/2025.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                if let title = post.title {
                    HStack {
                        Text(String(post.points))
                        Text(title)
                    }
                }
            }
            .navigationBarTitle("HACKER NEWS")
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.networkManager.fetchData()
            }
        }
    }
}

#Preview {
    ContentView()
}

