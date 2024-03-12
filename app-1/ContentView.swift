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
                    VStack(alignment: .leading){
                        Text("Hanoi speed")
                        //                .foregroundColor(.white)
                            .font(.system(size: 50,weight: .bold))
                    }.padding(.top,40)
                        .padding(.horizontal,40)
                        .padding(.bottom,60)
                        .background(Color.white)
        //                .padding(.horizontal,20)
                    .foregroundColor(dark)
                    Spacer()
                    VStack {
                        HStack {
                            NavigationLink{ tutorial()
                                
                            }label: {
                                Text("PLAY").frame(width: 300,height: 60)
                                    .background(dark).foregroundColor(Color.white)
                                    .font(.system(size: 30)).cornerRadius(15)
                            }.padding(.bottom,30)
                        }
                                
                        Button(action: {
                            detailview = true
                        })
                        {
                            Text("How to play?").frame(width: 300,height: 60)
                        }.background(dark).foregroundColor(.white)
                            .font(.system(size: 30)).cornerRadius(15) .navigationDestination(isPresented: $detailview){
                                detail()
                            }
                        Spacer()
                            
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
