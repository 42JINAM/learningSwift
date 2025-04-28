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
    
    func getUrlByCity(city: String, option: String) -> String{
        let appId = "appid=\(openWeatherApi)"
        let city = "&q=\(city)"
        let option = option
        let url = wetherURL + appId + city + option
        return (url)
    }
    func getUrlByCity(lat: String,lon:String, option: String) -> String{
        let appId = "appid=\(openWeatherApi)"
        let city = "&lat=\(lat)&lon=\(lon)"
        let option = option
        let url = wetherURL + appId + city + option
        return (url)
    }
}
