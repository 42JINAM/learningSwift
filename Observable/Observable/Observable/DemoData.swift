//
//  DemoData.swift
//  Observable
//
//  Created by Private on 20/05/2025.
//

import Foundation
import Combine

class DemoData : ObservableObject {
    @Published var userCount : Int = 0
    @Published var currentUser = ""
    
    init() {
        updateData()
    }
    
    func updateData() {
        
    }
    
}

