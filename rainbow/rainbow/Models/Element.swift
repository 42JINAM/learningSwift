//
//  Element.swift
//  Rainbow
//
//  Created by Private on 10/05/2025.
//

import Foundation
import UIKit

struct Element : Identifiable{
    let id: UUID
    var title: String
    
    init(title: String) {
        self.title = title
        id = UUID()
    }
}
