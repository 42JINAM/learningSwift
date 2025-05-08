//
//  SwiftModel.swift
//  Wishlist
//
//  Created by Private on 07/05/2025.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title: String
    var isCompleted: Bool = false
    
    init(title: String) {
        self.title = title
    }
}
