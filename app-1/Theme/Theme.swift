//
//  Theme.swift
//  app-1
//
//  Created by admin on 3/13/24.
//

import Foundation
import SwiftUI

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

var NormalTheme: [Color] = [
    Color.white,
    Color(UIColor(rgb: 0xD81212)), // Red
    Color(UIColor(rgb: 0xD88912)),
    Color(UIColor(rgb: 0xEFF312)),
    Color(UIColor(rgb: 0x81D812)),
    Color(UIColor(rgb: 0x12D885)),
    Color(UIColor(rgb: 0x12CCD8)),
    Color(UIColor(rgb: 0x1261D8)),
    Color(UIColor(rgb: 0x2E12D8)), // Purple
]
