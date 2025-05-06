//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Private on 06/05/2025.
//

import Foundation

let mainUrl = "https://hn.algolia.com/api/v1/search?tags=front_page&page="

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    private var currentPage = 0
    
    func fetchData() {
        let urlString = mainUrl + "\(currentPage)"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts.append(contentsOf: results.hits)
                                self.currentPage += 1
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
