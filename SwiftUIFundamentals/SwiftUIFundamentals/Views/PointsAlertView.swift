//
//  PointsAlertView.swift
//  SwiftUIFundamentals
//
//  Created by My3 Shenoy on 12/6/21.
//

import SwiftUI

struct PointsAlertExampleView: View {
    var body: some View {
        Color.gray
            .padding()
            .frame(maxWidth: UIScreen.main.bounds.width - UIScreen.main.bounds.width/4)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundedRectCornerRadius)
            .shadow(radius: 10, x: 5, y: 5)
    }
}

struct PointsAlertView: View {
    @Binding var showAlert: Bool
    @Binding var sliderValue: Double
    @Binding var game: GameLogic
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is".uppercased())
            BigNumberText(text: "\(roundedValue)")
            AlertBodyText(text: "You scored: \(points)")
            Button(action: {
                withAnimation {
                    showAlert = false
                }
                game.startNewRound(points: points)
            }) {
                AlertButtonText(text: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: UIScreen.main.bounds.width - UIScreen.main.bounds.width/4)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsAlertView_Previews: PreviewProvider {
    static private var showAlert = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(GameLogic())
    
    static var previews: some View {
        PointsAlertView(showAlert: showAlert, sliderValue: sliderValue, game: game)
        PointsAlertView(showAlert: showAlert, sliderValue: sliderValue, game: game).preferredColorScheme(.dark)
    }
}
