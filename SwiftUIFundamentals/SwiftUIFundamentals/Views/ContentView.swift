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
                        InstructionsView(game: $game)
                        SliderView(sliderValue: $sliderValue)
                        HitMeButtonView(showAlert: $showAlert,
                                        sliderValue: $sliderValue,
                                        game: $game)
                    }
                }
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: GameLogic
    var body: some View {
        VStack {
            InstructionText(text: "🎯 Put the bullseye as close as you can 🎯")
                .padding(20)
            BigNumberText(text: "\(game.target)")
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding(20)
    }
}

struct HitMeButtonView: View {
    @Binding var showAlert: Bool
    @Binding var sliderValue: Double
    @Binding var game: GameLogic
    
    var body: some View {
        Button(action: {
            showAlert = true
        }) {
            ButtonText(text: "Hit Me")
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
