//
//  ContentView.swift
//  app-1
//
//  Created by TemZ on 3/7/2566 BE.
//

import SwiftUI

struct ContentView: View {
    let dark = Color(red: 0.13, green: 0.15, blue: 0.19)
    @State private var detailview = false
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                        Text("Hanoi speed")
//                          .foregroundColor(.white)
                            .font(.system(size: 50,weight: .bold))
                    }
                    .padding(.top,40)
                    .padding(.horizontal,40)
                    .padding(.bottom,60)
                    .background(.opacity(0))
//                  .padding(.horizontal,20)
                    .foregroundColor(dark)
                    Spacer()
                VStack {
                    LinkComponent(text: "Play", destination: HanoiComponent())
                    LinkComponent(text: "Tutorial", destination: tutorial())
//                    Button("" , systemImage: "plus.circle") {
//                        
//                    }
//                    .font(.largeTitle)
//                        Spacer()
                    
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
