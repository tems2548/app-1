//
//  ButtonComponent.swift
//  app-1
//
//  Created by admin on 3/12/24.
//

import SwiftUI

struct HanoiComponent: View {
    @State var hanoi = Hanoi()
    
    @State var from: Int? = nil
    @State var outputError: String = ""
    @State var isSolved = false
    
    @State var moveCount = 0
    @State var showTime = "0.00"
    let startDate = Date.now
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    
    func tapHandler(i: Int) {
        if from == nil {
            from = i
        } else {
            let to = i
            do {
                try hanoi.move(from: from!, to: to)
                isSolved = hanoi.isSolved()
                if isSolved {
                    // stop timer
                    timer.upstream.connect().cancel()
                }
                outputError = ""
            } catch MyError.Message(let msg) {
                outputError = msg
            } catch {
                outputError = error.localizedDescription
            }
            from = nil
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    ForEach(0..<3) { i in
                        VStack {
                            TowerComponent(height: hanoi.height, topIdx: hanoi.indexs[i], arr: hanoi.towers[i], selected: from == i)
                        }
                        .onTapGesture {
                            tapHandler(i: i)
                        }
                    }
                }
                
                Text(outputError != "" ? "error: \(outputError)" : "")
                if isSolved {
                    Text("you'd win.")
                }
            }
            
            VStack {
                HStack {
                    Spacer()
                    Text("Move: \(moveCount)")
                        .font(.system(size: 40, weight: .bold))
                        .padding(.top, 50)
                        .padding(.horizontal, 60)
                }
                Spacer()
            }
            
            VStack {
                HStack {
                    Spacer()
                    Text("Time: \(showTime)")
                        .onReceive(timer) { firedDate in
                            showTime = String(format: "%.2f", Float(firedDate.timeIntervalSince(startDate)))
                        }
                        .font(.system(size: 40, weight: .bold))
                        .padding(.top, 50)
                        .padding(.horizontal, 60)
                    Spacer()
                }
                Spacer()
            }
            
        }
    }
}

struct HanoiComponent_Previews: PreviewProvider {
    static var previews: some View {
        HanoiComponent()
    }
}

