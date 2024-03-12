//
//  tutorial.swift
//  app-1
//
//  Created by TemZ on 12/3/2567 BE.
//

import SwiftUI

struct tutorial: View {
    var body: some View {
        HStack{
            ZStack {
                RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 10,height:100).padding(.bottom,50)
                VStack {
                    RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 25,height: 10)
                    RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 50,height: 10)
                    RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 100,height: 10)
                    RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 150,height: 10)
                    
                }
//                Spacer()
            };
            ZStack {
                RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 10,height:100).padding(.bottom,50)
                VStack {
                    RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 25,height: 10)
                    RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 50,height: 10)
                    RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 100,height: 10)
                    RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 150,height: 10)
                    
                }
//                Spacer()
            };
            ZStack {
                RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 10,height:100).padding(.bottom,50)
                VStack {
                    RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 25,height: 10)
                    RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 50,height: 10)
                    RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 100,height: 10)
                    RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 150,height: 10)
                    
                }
                
            };Spacer()
        }
    }
}

struct tutorial_Previews: PreviewProvider {
    static var previews: some View {
        tutorial()
    }
}
