//
//  tutorial.swift
//  app-1
//
//  Created by TemZ on 12/3/2567 BE.
//

import SwiftUI

struct tutorial: View {
    let dark = Color(red: 0.13, green: 0.15, blue: 0.19)
    var body: some View {
        NavigationStack {
            VStack {
                Image("Tutorialimg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .frame(maxWidth: .infinity)
//                    .imageScale(.medium)
                    .padding(.bottom, 40)
                    .padding(.horizontal, 60)
                Text("RULES")
                    .font(.system(size: 50))
                    .padding(.bottom,20)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                ZStack {
                    RoundedRectangle(cornerRadius: 20).fill(dark).frame(width: .infinity,height: 225).padding(.horizontal,40)
                    Text("- Transfer all discs from the first tower to the third tower.\nOnly one disc can be moved at a time.\n- Only the top disc of one stack can be transferred to the top of another stack or an empty rod.\n- Larger discs cannot be stacked over smaller ones.")
                        .font(.title).foregroundStyle(.white).padding(.horizontal,40)
                }
            }
            .navigationTitle("Tutorial")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
struct tutorial_Previews: PreviewProvider {
    static var previews: some View {
        tutorial()
    }
}
