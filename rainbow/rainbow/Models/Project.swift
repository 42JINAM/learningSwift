//
//  Project.swift
//  Rainbow
//
//  Created by Private on 09/05/2025.
//

import SwiftUI
import Foundation

struct Project: Identifiable{
    let id: UUID
    var title: String
    var r: Double
    var g: Double
    var b: Double
    var elements: [Element] = []
    
    func getMainColor() -> (r: Double, g: Double, b: Double) {
        return (r, g, b)
    }
    
    init(newTitle: String) {
        title = newTitle
        id = UUID()
        let color = colorFromUUID(id)
        r = color.r
        g = color.g
        b = color.b
    }

}

func colorFromUUID(_ uuid: UUID) -> (r: Double, g: Double, b: Double) {
    let uuidString = uuid.uuidString.replacingOccurrences(of: "-", with: "")
    let hash = uuidString.hashValue.magnitude

    // Hue: 0~360도
    let hue = Double(hash % 360)
    // Saturation: 40~60% (적당히 탁하게)
    let saturation = 0.5
    // Lightness: 60~75% (밝고 부드럽게)
    let lightness = 0.7

    let color = hslToRgb(h: hue, s: saturation, l: lightness)
    return (color.r, color.g, color.b)
}

func hslToRgb(h: Double, s: Double, l: Double) -> (r: Double, g: Double, b: Double) {
    let c = (1 - abs(2 * l - 1)) * s
    let x = c * (1 - abs((h / 60).truncatingRemainder(dividingBy: 2) - 1))
    let m = l - c / 2

    var r = 0.0, g = 0.0, b = 0.0

    switch h {
    case 0..<60:    (r, g, b) = (c, x, 0)
    case 60..<120:  (r, g, b) = (x, c, 0)
    case 120..<180: (r, g, b) = (0, c, x)
    case 180..<240: (r, g, b) = (0, x, c)
    case 240..<300: (r, g, b) = (x, 0, c)
    case 300..<360: (r, g, b) = (c, 0, x)
    default:        (r, g, b) = (0, 0, 0)
    }

    return (r + m, g + m, b + m)
}
