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
            List {
                ForEach(networkManager.posts) { post in
                    if let title = post.title { 
                        HStack {
                            Text(String(post.points))
                            Text(title)
                        }
                        .onAppear {
                            if let lastPost = self.networkManager.posts.last, post == lastPost {
                                self.networkManager.fetchData()
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("HACKER NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}

