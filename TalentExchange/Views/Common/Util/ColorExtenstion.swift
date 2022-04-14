// ColorExtentsion.swift
 
import SwiftUI

extension Color {
 
    static let grayF4 = Color(hex: "F4F4F4")
    static let grayE5 = Color(hex: "e5e5e5")
    static let darkgray = Color(hex: "2f2e41")
    static let ivory = Color(hex: "f8ede3")
    static let brown = Color(hex: "897853")  // #을 제거하고 사용해도 됩니다.
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
