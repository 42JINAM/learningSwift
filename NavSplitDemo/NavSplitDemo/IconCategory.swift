//
//  IconCategory.swift
//  NavSplitDemo
//
//  Created by Private on 30/05/2025.
//

import Foundation

struct IconCategory: Identifiable, Hashable {
    let id = UUID()
    var categoryName: String
    var images: [String]
}
