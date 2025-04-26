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
        performRequest(urlString: weatherAPI.getUrl(city: location, option: option))

    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            task.resume()
            
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) -> Void {
        if error != nil {
            print(error!)
            return
        }
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
