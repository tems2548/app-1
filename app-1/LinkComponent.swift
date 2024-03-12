//
//  ButtonComponent.swift
//  app-1
//
//  Created by admin on 3/12/24.
//

import SwiftUI

struct LinkComponent<Destination: View>: View {
    // parameters
    var text: String
    var destination: Destination
    var width: CGFloat = 300
    var height: CGFloat = 60
    
    let dark = Color(red: 0.13, green: 0.15, blue: 0.19)
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(text)
                .frame(width: width, height: height)
                .background(dark)
                .foregroundColor(Color.white)
                .font(.system(size: 30))
                .cornerRadius(15)
        }
        .padding(.bottom, 30)
    }
}

struct LinkComponent_Previews: PreviewProvider {
    static var previews: some View {
        LinkComponent(text: "hello world", destination: tutorial())
    }
}

