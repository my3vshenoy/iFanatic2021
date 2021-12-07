//
//  BackgroundView.swift
//  SwiftUIFundamentals
//
//  Created by My3 Shenoy on 12/5/21.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: GameLogic
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}

struct TopView: View {
    @Binding var game: GameLogic
    
    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct RingsView: View {
    @Environment (\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<5) { circleNumber in
                let size = CGFloat(circleNumber * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(RadialGradient(gradient: Gradient(colors: [Color("GradientColor").opacity(0.8 * opacity), Color("GradientColor").opacity(0)]),
                                         center: .center,
                                         startRadius: 100,
                                         endRadius: 300))
                            .frame(width: size, height: size)
            }
        }
    }
}

struct ScoreInfoView: View {
    var title: String
    var text: String
    
    var body: some View {
        BottomLabelView(titleText: title, numberText: text)
    }
}

struct BottomView: View {
    @Binding var game: GameLogic
    
    var body: some View {
        HStack {
            ScoreInfoView(title: "Score", text: String(game.score))
            Spacer()
            ScoreInfoView(title: "Round", text: String(game.currentRound))
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(GameLogic()))
        BackgroundView(game: .constant(GameLogic())).preferredColorScheme(.dark)
    }
}
