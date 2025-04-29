//
//  CoinData.swift
//  ByteCoin
//
//  Created by Private on 28/04/2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let type: String
    let quote: String
    let rate: Double
    
    enum CodingKeys: String, CodingKey {
        case type = "asset_id_base"
        case quote = "asset_id_quote"
        case rate
    }
}
