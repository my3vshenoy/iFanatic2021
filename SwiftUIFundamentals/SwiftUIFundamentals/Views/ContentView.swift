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
    @State private var game = GameLogic()
    
    var body: some View {
        ZStack {
            // Custom Color
            // Color(red: 243/255.0, green: 248/255.0, blue: 253/255.0)
            
            // Asset Catalog Color
            Color("BackgroundColor")
            // Ignore Safe Area
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                VStack {
                    VStack {
                        Text("🎯 Put the bullseye as close as you can 🎯".uppercased())
                            .foregroundColor(Color("TextColor")) // Asset Catalog
                            .kerning(2.0)
                            .bold()
                            .multilineTextAlignment(.center)
                            .lineSpacing(4)
                            .font(.footnote)
                            .padding(20)
                        Text("\(game.target)")
                            .bold()
                            .kerning(-1)
                            .fontWeight(.black)
                            .font(.largeTitle)
                        HStack {
                            Text("1")
                                .bold()
                                .foregroundColor(Color("TextColor")) // Asset Catalog
                                .fontWeight(.black)
                            Slider(value: $sliderValue, in: 1.0...100.0)
                            Text("100")
                                .bold()
                                .foregroundColor(Color("TextColor")) // Asset Catalog
                                .fontWeight(.black)
                        }
                        .padding(20)
                    }
                    Button(action: {
                        showAlert = true
                    }) {
                        // Bold the text, not the button
                        Text("Hit Me".uppercased())
                            .bold()
                            .font(.title)
                    }
                    .padding(16.0)
                    .background(ZStack {
                        Color("ButtonColor")
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.blue]), startPoint: .top, endPoint: .bottom)
                    }) // Asset Color
                    .foregroundColor(.white)
                    .cornerRadius(21.0)
                    .alert(isPresented: $showAlert) {
                        let roundedValue = Int(sliderValue.rounded())
                        let points = game.points(sliderValue: Int(sliderValue.rounded()))
                        return Alert(title: Text("Hello There!"), message: Text("Slider value: \(roundedValue)\n" + "Points this round: \(points)"), dismissButton: .default(Text("Awesome")))
                    }
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
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
