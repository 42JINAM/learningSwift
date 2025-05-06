//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Private on 06/05/2025.
//

import Foundation

let mainUrl = "https://hn.algolia.com/api/v1/search?query="
class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    func fetchData() {
        guard let url = URL(string: mainUrl) else { return }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Network request error: \(error.localizedDescription)")
                return
            }

            if let data = data {
                print("Raw response: ", String(data: data, encoding: .utf8) ?? "Invalid")
                do {
                    let results = try JSONDecoder().decode(Results.self, from: data)
                    DispatchQueue.main.async {
                        self.posts = results.hits
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            }
        }
        task.resume()
    }
}
