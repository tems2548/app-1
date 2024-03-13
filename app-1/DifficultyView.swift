//
//  setting.swift
//  app-1
//
//  Created by TemZ on 12/3/2567 BE.
//

import SwiftUI


struct difficulty: View {
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
    
    var bestRecord = BestRecord.loadBestRecord()
    
    var body: some View {
        VStack {
            Text("Please select difficulty").font(.system(size: 80,weight: .bold))
                .padding(.top,60)
            Spacer()
            HStack {
                Spacer()
                // left
                ZStack {
                    RoundedRectangle(cornerRadius: 35).fill(dark)
                        .frame(width: 150,height: 150)
                    RoundedRectangle(cornerRadius: 20).fill(Color.init(red: 1, green: 0.49, blue: 0.49))
                        .frame(width: 125,height: 125)
                    Button("-", action:{
                        diff -= 1
                        lim()
                    }).font(.system(size: 100)).foregroundColor(.black)
                }
                Spacer()
                // middle
                ZStack {
                    RoundedRectangle(cornerRadius: 35).fill(dark)
                        .frame(width: 300,height: 300)
                    RoundedRectangle(cornerRadius: 20).fill(Color.white)
                        .frame(width: 250,height: 250)
                    Text("\(diff)").font(.system(size: 80))
                }
                Spacer()
                //right
                ZStack {

                    RoundedRectangle(cornerRadius: 35).fill(dark)
                        .frame(width: 150,height: 150)
                    RoundedRectangle(cornerRadius: 20).fill(Color.init(red: 0.49, green: 1, blue: 0.49))
                        .frame(width: 125,height: 125)
                    Button("+", action:{
                        diff += 1
                        lim()
                    }).font(.system(size: 100)).foregroundStyle(.black)

                }
                
                Spacer()
                
            }
            
            ForEach(3..<9) { idx in
                Text("\(idx) => time: \(bestRecord.records[idx]?.time ?? Float.infinity) | moves: \(bestRecord.records[idx]?.moveCount ?? Int.max)")
            }
            
            Spacer()
            LinkComponent(text: "Start !!!", destination: HanoiComponent(height: $diff))
            
        }
        
    }

}

struct difficulty_Previews: PreviewProvider {
    static var previews: some View {
        difficulty()
    }
}
