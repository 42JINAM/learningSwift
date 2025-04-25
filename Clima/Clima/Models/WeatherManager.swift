//
//  WeatherManager.swift
//  Clima
//
//  Created by jinam on 4/25/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    var weatherAPI: WeatherAPI = WeatherAPI()
    
    func fetchWeather(_ location: String) {
        let option = "&units=metric"
        print(weatherAPI.getUrl(city: location, option: option))

    }
}
