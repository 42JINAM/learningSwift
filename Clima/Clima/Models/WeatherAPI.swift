//
//  WeatherAPI.swift
//  Clima
//
//  Created by jinam on 4/25/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

struct WeatherAPI {
    let wetherURL = "https://api.openweathermap.org/data/2.5/weather?"
    
    func getUrl(city: String, option: String) -> String{
        let appId = "appid=\(openWeatherApi)"
        let city = "&q=\(city)"
        let option = option
        let url = wetherURL + appId + city + option
        return (url)
    }
}
