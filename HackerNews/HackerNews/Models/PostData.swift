//
//  PostData.swift
//  HackerNews
//
//  Created by Private on 06/05/2025.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
    let page: Int
}

struct Post: Decodable, Identifiable{
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String?
    let url: String?
}
