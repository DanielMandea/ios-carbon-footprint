//
//  UIColorExtension.swift
//  Donations
//
//  Created by Daniel Mandea on 23/06/2020.
//  Copyright © 2020 IBM CJ COVID. All rights reserved.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Color {
    
    // MARK: - Blue
    
    static var darkBlue: Color = Color(hex: "0D131D")
    static var lightBlue: Color = Color(hex: "203456")
    
    // MARK: - Green
    
    static var neonGreen: Color = Color(hex: "3CDDAA")
    
    // MARK: - Gray
    
    static var firstGray: Color = Color(.displayP3, red: 36, green: 41, blue: 49, opacity: 1)
}
