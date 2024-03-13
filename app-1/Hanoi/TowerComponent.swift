//
//  TowerComponent.swift
//  app-1
//
//  Created by admin on 3/12/24.
//

import SwiftUI

struct TowerComponent: View {
    // params
    var height: Int
    var topIdx: Int?
    var arr: [Int?]
    var selected = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor(rgb: 0xD9D9D9)))
                    .frame(width: 10, height: CGFloat(250))
            }
            
            VStack {
                Spacer()
                ForEach(0..<height) { idx in
                    let width = (arr[height-idx-1] != nil) ?
                        (CGFloat(50 + 25*arr[height-idx-1]!)) :
                        (CGFloat(0))
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(arr[height-idx-1] != nil ? NormalTheme[arr[height-idx-1]!] : NormalTheme[0])
                        .frame(width: width, height: 15)
                        .padding(selected && topIdx != nil && height-idx-1 == topIdx ? 30 : 0)
                }
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor(rgb: 0xD9D9D9)))
                    .frame(width: CGFloat(200 + 10*height), height: 15)
            }
            
        }
    }
    
}

struct TowerComponent_Previews: PreviewProvider {
    static var previews: some View {
        TowerComponent(height: 7, topIdx: 6, arr: [1, 1, 1, 1, 1, 1, 1], selected: true)
    }
}
