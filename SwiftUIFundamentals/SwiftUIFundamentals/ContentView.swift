//
//  ContentView.swift
//  SwiftUIFundamentals
//
//  Created by My3 Shenoy on 12/3/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Text("🎯 PUT THE BULLSEYE AS CLOSE AS YOU CAN TO 🎯")
                    .kerning(2.0)
                    .bold()
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .font(.footnote)
                Text("89")
                    .bold()
                    .kerning(-1)
                    .fontWeight(.black)
                    .font(.largeTitle)
                HStack {
                    Text("1")
                        .bold()
                        .fontWeight(.black)
                    Slider(value: .constant(50), in: 1.0...100.0)
                    Text("100")
                        .bold()
                        .fontWeight(.black)
                }
            }
            Button(action: {}) {
                Text("Hit Me")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
