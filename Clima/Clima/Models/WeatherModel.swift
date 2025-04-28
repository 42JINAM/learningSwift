//
//  WeatherModel.swift
//  Clima
//
//  Created by Private on 27/04/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    var conditionName: String {
        switch conditionId {
        case 800:
            return "sun.max"               // Clear Sky
        case 801:
            return "cloud.sun"             // Few clouds
        case 802:
            return "cloud.sun.fill"        // Scattered clouds
        case 803:
            return "cloud"                 // Broken clouds
        case 804:
            return "cloud.fill"            // Overcast clouds
        case 500...531:
            return "cloud.rain.fill"       // Rain (Light, Moderate, Heavy, etc.)
        case 600...622:
            return "cloud.snow"            // Snow
        case 200...232:
            return "cloud.bolt.rain"       // Thunderstorm
        case 701...781:
            return "cloud.fog"             // Mist, Haze, Fog, etc.
        default:
            return "cloud"                 // 기본 아이콘 (없으면)
        }       
    }
    var stringTemp: String {
        return (String(format: "%.1f", temperature))
    }
}
