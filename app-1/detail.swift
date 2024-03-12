//
//  detail.swift
//  app-1
//
//  Created by TemZ on 12/3/2567 BE.
//

import SwiftUI

struct detail: View {
    var body: some View {
        VStack {
            HStack(alignment:.center){
                LinkComponent(text: "back", destination: ContentView()
                )
                Spacer()
                Text("10:05").font(.system(size: 44))
                Spacer()

            }
            HStack(alignment:
                    .bottom){
                        Stacks(Stack: 7)
                        Stacks(Stack: 7)
                        Stacks(Stack: 7)
                    }.padding(.top,40)
        }

    }
}

struct detail_Previews: PreviewProvider {
    static var previews: some View {
        detail()
    }
}
