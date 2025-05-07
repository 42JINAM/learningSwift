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
    
    init(title: String) {
        self.title = title
    }
}
