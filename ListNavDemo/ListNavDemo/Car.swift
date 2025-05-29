//
//  Car.swift
//  ListNavDemo
//
//  Created by Private on 29/05/2025.
//

import Foundation

struct Car: Codable, Identifiable {
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    var imageName: String
}
