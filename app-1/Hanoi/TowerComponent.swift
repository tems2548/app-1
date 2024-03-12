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
                    .fill(Color.cyan)
                    .frame(width: 10, height: CGFloat(250))
            }
            
            VStack {
                Spacer()
                ForEach(0..<height) { idx in
                    var width = (arr[height-idx-1] != nil) ? 
                        (CGFloat(50 + 25*arr[height-idx-1]!)) :
                        (CGFloat(0))
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.cyan)
                        .frame(width: width, height: 15)
                        .padding(selected && topIdx != nil && height-idx-1 == topIdx ? 30 : 0)
                }
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.red)
                    .frame(width: CGFloat(200 + 10*height), height: 15)
                
                Text("topIdx: \(topIdx ?? -555)")
            }
            
        }
    }
    
}

struct TowerComponent_Previews: PreviewProvider {
    static var previews: some View {
        TowerComponent(height: 7, topIdx: 6, arr: [1, 1, 1, 1, 1, 1, 1], selected: true)
    }
}
