//
//  Profile.swift
//  Landmarks
//
//  Created by Private on 13/05/2025.
//

import Foundation

struct Profile {
    var username: String
    var preferNotifivations = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
