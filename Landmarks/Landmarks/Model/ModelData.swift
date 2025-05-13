//
//  Data.swift
//  Landmarks
//
//  Created by Private on 12/05/2025.
//

import Foundation

@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured}
    }
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ file: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: file, withExtension: nil)
    else {
        fatalError("Couldn't find \(file) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could'nt load \(file) frome main bundle: \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Coudn't parse \(file) as \(T.self): \(error)")
    }
}
