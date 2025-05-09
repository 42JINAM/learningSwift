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
    
    let uuidString = uuid.uuidString.replacingOccurrences(of: "-", with: "") // UUID에서 "-"를 제거하여 연속된 32자리 문자열을 만든다.
    let r = Int(uuidString.prefix(2), radix: 16) ?? 0 // Red
    let g = Int(uuidString.prefix(4).suffix(2), radix: 16) ?? 0 // Green
    let b = Int(uuidString.prefix(6).suffix(2), radix: 16) ?? 0 // Blue

    // 각 색상 값이 0~255 범위 내로 유지되도록 보정
    return (
        Double(r % 256) / 255.0,
        Double(g % 256) / 255.0,
        Double(b % 256) / 255.0
    )
}
