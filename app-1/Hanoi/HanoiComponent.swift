//
//  ButtonComponent.swift
//  app-1
//
//  Created by admin on 3/12/24.
//

import SwiftUI

struct HanoiComponent: View {
    // parameters
    @State var hanoi = Hanoi()
    @State var from: Int? = nil
    @State var outputError: String = ""
    @State var isSolved = false
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<3) { i in
                    VStack {
                        ForEach(0..<hanoi.height) { rj in
                            if let num = hanoi.towers[i][hanoi.height-rj-1] {
                                Text("\(num)")
                            } else {
                                Text("|")
                            }
                        }
                    }
                }
            }
            
            HStack {
                ForEach(0..<3)  { i in
                    Button("\(i)") {
                        print("heyy \(i)")
                        if from == nil {
                            from = i
                        } else {
                            let to = i
                            do {
                                try hanoi.move(from: from!, to: to)
                                isSolved = hanoi.isSolved()
                                outputError = ""
                            } catch MyError.Message(let msg) {
                                outputError = msg
                            } catch {
                                outputError = error.localizedDescription
                            }
                            from = nil
                        }
                    }
                }
            }
            
            Text(outputError != "" ? "error: \(outputError)" : "")
            if isSolved {
                Text("you'd win.")
            }
//            Text("outputError = \(outputError)")
//            Text("from = \(from ?? -555)")
            
            
        }
    }
}

struct HanoiComponent_Previews: PreviewProvider {
    static var previews: some View {
        HanoiComponent()
    }
}

