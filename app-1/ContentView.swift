//
//  ContentView.swift
//  app-1
//
//  Created by TemZ on 3/7/2566 BE.
//

import SwiftUI

struct ContentView: View {
    let dark = Color(red: 0.13, green: 0.15, blue: 0.19)
    @State var bestRecord = BestRecord.loadBestRecord()
    @State var isOpen = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                        Text("Hanoi speed")
                            .font(.system(size: 100,weight: .bold))
                    }
                    .padding(.top,80)
                    .padding(.horizontal,40)
                    .padding(.bottom,60)
                    .background(.opacity(0))
                    .foregroundColor(dark)
                    Spacer()
                VStack {
                    LinkComponent(text: "Play", destination: DifficultyView()).navigationBarBackButtonHidden(true)
                    LinkComponent(text: "Tutorial", destination: tutorial()).navigationBarBackButtonHidden(true)
                    Button("Best Records") {
                        isOpen.toggle()
                    }
                    .frame(width: 300, height: 60)
                    .background(dark)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
                    .cornerRadius(15)
                    
                }
                .padding(.bottom, 200)
                
            }
            .background(
                Image("HomePage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            )
        }
        .sheet(isPresented: $isOpen) {
            SheetView(bestRecord: $bestRecord)
        }
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dissmiss
    
    @Binding var bestRecord: BestRecord
    
    var body: some View {
        VStack {
            Button("Close") {
                dissmiss()
            }
            .padding(.top, 20)
            
            List(3..<9) { idx in
                VStack(alignment: .leading) {
                    Text("Difficulty \(idx)")
                        .font(.title)
                        .italic()
                        .foregroundStyle(.gray)
                    Text("Best time **\(bestRecord.stringTime(idx))**")
                        .font(.title2)
                    Text("Best moves **\(bestRecord.stringMoveCount(idx))**")
                        .font(.title2)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
