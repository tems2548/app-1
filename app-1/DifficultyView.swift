//
//  setting.swift
//  app-1
//
//  Created by TemZ on 12/3/2567 BE.
//

import SwiftUI
import UIKit

struct DifficultyView: View {
    let dark = Color(red: 0.13, green: 0.15, blue: 0.19)
    @State var diff = 3
    var steper = 1
    var range = 1
    func lim() {
        if diff > 8{
            diff = 8
        }else if diff < 3{
            diff = 3
        }
    }
    
    
    var body: some View {
        VStack {
            HStack() {
                LinkComponent(text: "Back", destination: ContentView(), width: 200)
                    .navigationBarBackButtonHidden(true)
                    .padding(.top, 20)
                    .padding(.leading, 40)
                Spacer()
            }
            
            Text("Please select difficulty").font(.system(size: 60,weight: .bold))
                .padding(.top,10)
            Spacer()
            HStack {
                Spacer()
                // left
                ZStack {
                    RoundedRectangle(cornerRadius: 35).fill(dark)
                        .frame(width: 100,height: 100)
                    RoundedRectangle(cornerRadius: 20).fill(Color.init(red: 1, green: 0.49, blue: 0.49))
                        .frame(width: 75,height: 75)
                    Button("-", action:{
                        diff -= 1
                        lim()
                    }).font(.system(size: 70)).foregroundColor(.black)
                }
                Spacer()
                // middle
                ZStack {
                    RoundedRectangle(cornerRadius: 35).fill(dark)
                        .frame(width: 250,height: 250)
                    RoundedRectangle(cornerRadius: 20).fill(Color.white)
                        .frame(width: 200,height: 200)
                    Text("\(diff)").font(.system(size: 80))
                }
                Spacer()
                //right
                ZStack {

                    RoundedRectangle(cornerRadius: 35).fill(dark)
                        .frame(width: 100,height: 100)
                    RoundedRectangle(cornerRadius: 20).fill(Color.init(red: 0.49, green: 1, blue: 0.49))
                        .frame(width: 75,height: 75)
                    Button("+", action:{
                        diff += 1
                        lim()
                    }).font(.system(size: 70)).foregroundStyle(.black)

                }
                
                Spacer()
                
            }
            
            Spacer()
            LinkComponent(text: "Start !!!", destination: HanoiComponent(height: $diff))
            
        }
        
    }

}

struct DifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyView()
    }
}
