//
//  WeatherDeligate.swift
//  Clima
//
//  Created by Private on 28/04/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherDeligate {
    let deligate: WeatherViewController?
    
    func didUpdateWeather()
}
