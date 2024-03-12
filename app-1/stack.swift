//
//  stack.swift
//  app-1
//
//  Created by TemZ on 12/3/2567 BE.
//

import Foundation
import SwiftUI
struct Stacks: View {
    @State var Stack:Int
    var body: some View {
        ZStack {
            VStack{
                ForEach(0..<Stack) { num in
                    VStack {
                        RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 10 + CGFloat(num)*30,height: 15)
                    }
                }
                
            };
            VStack {
                RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width:10,height: 150+CGFloat(Stack*3))
                RoundedRectangle(cornerRadius: 10).fill(Color.red).frame(width:200+CGFloat(Stack*10),height: 15)
        }
        }
    }
    
}


//    func Stacks(num : Int,Stack : Int){
//        ForEach(0..<Stack) { num in
//            ZStack{
//                VStack {
//                    RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 10 + CGFloat(num)*50,height: 10)
//                }
//                
//            }
//        }
//        
//    }
////    ZStack {
////        RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 10,height:100).padding(.bottom,50)
////        VStack {
////            RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 25,height: 10)
////            RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 50,height: 10)
////            RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 100,height: 10)
////            RoundedRectangle(cornerRadius: 10).fill(Color.cyan).frame(width: 150,height: 10)
////
////        }
//////                Spacer()
////    };
//
//}
