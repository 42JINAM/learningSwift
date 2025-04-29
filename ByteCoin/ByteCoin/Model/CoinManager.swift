//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDeligate {
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinData)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = coinApi
    let delegate: CoinManagerDeligate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getURL(quote: String) -> String {
        let url = baseURL + "/\(quote)?apikey=\(apiKey)"
        return (url)
    }
    
    func getCoinPrice(for currency: String) {
        performRequest(with: self.getURL(quote: currency))
    }
    
    func performRequest(with urlString: String) {
        print(urlString)
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handleResponse(data:response:error:))
            task.resume()
        }
    }
    
    func handleResponse(data: Data?, response: URLResponse?, error: Error?){
        if error != nil {
            delegate?.didFailWithError(error: error!)
            return
        }
        if let safeData = data {
            if let coinData = self.parseJSON(safeData) {
                delegate?.didUpdateCoin(self, coin: coinData)
            }
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinData? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}
