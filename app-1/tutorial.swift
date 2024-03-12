//
//  tutorial.swift
//  app-1
//
//  Created by TemZ on 12/3/2567 BE.
//

import SwiftUI

struct tutorial: View {
    var body: some View {
        HStack{
            Stacks(Stack: 7)
            Stacks(Stack: 0)
        }
    }
}

struct tutorial_Previews: PreviewProvider {
    static var previews: some View {
        tutorial()
    }
}
