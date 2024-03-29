//
//  ButtonComponent.swift
//  app-1
//
//  Created by admin on 3/12/24.
//

import SwiftUI

struct HanoiComponent: View {
    @Binding var height: Int

    @State var hanoi: Hanoi? = nil
    
    @State var from: Int? = nil
    @State var outputError: String = ""
    @State var isSolved = false
    
    @State var moveCount = 0
    @State var showTime = "0.00"
    @State var startDate = Date.now
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @State var bestRecord = BestRecord.loadBestRecord()
    
    func tapHandler(i: Int) {
        if from == nil {
            from = i
        } else {
            let to = i
            do {
                try hanoi!.move(from: from!, to: to)
                if from != to {
                    moveCount += 1
                }
                isSolved = hanoi!.isSolved()
                if isSolved {
                    // stop timer
                    timer.upstream.connect().cancel()
                    try setNewBestRecord()
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
    
    func setNewBestRecord() throws {
        let time = Float(showTime) ?? Float.infinity
        
        if bestRecord.records[height] == nil {
            bestRecord.records[height] = Record(time: time, moveCount: moveCount)
        } else {
            if moveCount < bestRecord.records[height]!.moveCount {
                bestRecord.records[height]!.moveCount = moveCount
            }
            
            if time < bestRecord.records[height]!.time {
                bestRecord.records[height]!.time = time
            }
        }
        
        try BestRecord.saveBestRecord(bestRecord: bestRecord)
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    ForEach(0..<3) { i in
                        VStack {
                            if let hanoi {
                                TowerComponent(height: hanoi.height, topIdx: hanoi.indexs[i], arr: hanoi.towers[i], selected: from == i)
                            }
                        }
                        .onTapGesture {
                            tapHandler(i: i)
                        }
                    }
                }
                
                Text(outputError != "" ? "error: \(outputError)" : "")
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
            
            if isSolved {
                VStack {
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .opacity(0.7)
                
                VStack {
                    Text("Congratulations 🤫🧏‍♂️")
                        .font(.system(size: 70, weight: .bold))
                        .padding(.top, 30)
                    Spacer()
                    Text("You solved the Hanoi Tower in")
                        .font(.system(size: 24))
                    Text("**\(showTime)** Seconds and **\(moveCount)** Moves")
                        .font(.system(size: 48))
                    
                    Text("Your best record on Difficulty \(height) is")
                        .font(.system(size: 24))
                    Text("**\(bestRecord.stringTime(height))** Seconds and **\(bestRecord.stringMoveCount(height))** Moves")
                        .font(.system(size: 24))
                    Spacer()
                    HStack(spacing: 40) {
                        LinkComponent(text: "Play Again", destination: DifficultyView()).navigationBarBackButtonHidden(true)
                        LinkComponent(text: "Back", destination: ContentView()).navigationBarBackButtonHidden(true)
                    }
                }
            }
            
        }
        .onAppear {
            hanoi = Hanoi(rods: 3, height: height)
            startDate = Date.now
        }
    }
}

struct HanoiComponent_Previews: PreviewProvider {
    static var previews: some View {
        HanoiComponent(height: .constant(3))
    }
}

