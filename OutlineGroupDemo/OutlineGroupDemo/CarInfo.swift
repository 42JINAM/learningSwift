//
//  CarInfo.swift
//  OutlineGroupDemo
//
//  Created by Private on 30/05/2025.
//

import Foundation

struct CarInfo: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var children: [CarInfo]?
}
