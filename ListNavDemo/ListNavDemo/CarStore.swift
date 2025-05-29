//
//  CarStore.swift
//  ListNavDemo
//
//  Created by Private on 29/05/2025.
//

import Foundation
import Combine

class CarStore: ObservableObject {
    @Published var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
