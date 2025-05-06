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
                    if let urlString = post.url {
                        NavigationLink(destination: DetailView(url: urlString)) {
                            if let title = post.title {
                                HStack {
                                    Text(String(post.points))
                                    Text(title)
                                }
                                .onAppear {
                                    if let lastPost = self.networkManager.posts.last, post.id == lastPost.id {
                                        networkManager.fetchData()
                                    }
                                }
                            }
                        }
                    } else if let title = post.title {
                        HStack {
                            Text(String(post.points))
                            Text(title)
                        }
                        .onAppear {
                            if let lastPost = self.networkManager.posts.last, post.id == lastPost.id {
                                networkManager.fetchData()
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("HACKER NEWS")
        }
        .onAppear {
            if networkManager.posts.isEmpty {
                networkManager.fetchInitialData()
            }
        }
    }
}

#Preview {
    ContentView()
}

