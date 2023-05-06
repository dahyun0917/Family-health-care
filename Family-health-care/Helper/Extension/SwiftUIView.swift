//
//  ColorExtension.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/04.
//

import SwiftUI

extension Color{
    static let mainBlue = Color(hex:"5596B6")
    static let mainGrey = Color(hex:"EEEEEE")
    static let mainBeige = Color(hex:"E5D6C6")
    static let mainLightBeige = Color(hex:"FdF1DE")
}

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}
