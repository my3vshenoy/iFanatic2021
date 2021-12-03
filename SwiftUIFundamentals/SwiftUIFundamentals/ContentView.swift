//
//  ContentView.swift
//  SwiftUIFundamentals
//
//  Created by My3 Shenoy on 12/3/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var sliderValue = 10.0
    
    var body: some View {
        VStack {
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
                        Slider(value: $sliderValue, in: 1.0...100.0)
                        Text("100")
                            .bold()
                            .fontWeight(.black)
                    }
                }
                Button(action: {
                    showAlert = true
                }) {
                    Text("Hit Me")
                }
                .alert(isPresented: $showAlert) {
                    let roundedValue = Int(sliderValue.rounded())
                    return Alert(title: Text("Hello There!"), message: Text("Slider value: \(roundedValue)"), dismissButton: .default(Text("Awesome")))
                }
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
