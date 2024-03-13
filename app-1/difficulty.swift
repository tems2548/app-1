//
//  setting.swift
//  app-1
//
//  Created by TemZ on 12/3/2567 BE.
//

import SwiftUI


struct setting: View {
    @State var diff = 0
    var steper = 1
    var range = 1
    func lim() {
        if diff > 8{
            diff = 8
        }else if diff < 0{
            diff = 0
        }
    }
    
    var body: some View {
        VStack {
            Text("Difficulty").font(.system(size: 60,weight: .bold))
                .padding(.top,50)
            Spacer()
            HStack {
                Spacer()
                // left
                ZStack {
                    RoundedRectangle(cornerRadius: 20).fill(Color.cyan)
                        .frame(width: 150,height: 150)
                    RoundedRectangle(cornerRadius: 20).fill(Color.white)
                        .frame(width: 125,height: 125)
                    Button("-", action:{
                        diff -= 1
                        lim()
                    }).font(.system(size: 100)).foregroundColor(.black)
                }
                Spacer()
                // middle
                ZStack {
                    RoundedRectangle(cornerRadius: 20).fill(Color.cyan)
                        .frame(width: 300,height: 300)
                    RoundedRectangle(cornerRadius: 20).fill(Color.white)
                        .frame(width: 250,height: 250)
                    Text("\(diff)").font(.system(size: 80))
                }
                Spacer()
                //right
                ZStack {

                    RoundedRectangle(cornerRadius: 20).fill(Color.cyan)
                        .frame(width: 150,height: 150)
                    RoundedRectangle(cornerRadius: 20).fill(Color.white)
                        .frame(width: 125,height: 125)
                    Button("+", action:{
                        diff += 1
                        lim()
                    }).font(.system(size: 100)).foregroundStyle(.black)

                }
                
                Spacer()
                
            }
        
            Spacer()
            LinkComponent(text: "Start", destination: HanoiComponent())
            
        }
        
    }

}

struct setting_Previews: PreviewProvider {
    static var previews: some View {
        setting()
    }
}
