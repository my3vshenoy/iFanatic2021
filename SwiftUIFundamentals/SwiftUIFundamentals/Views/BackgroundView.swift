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
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct TopView: View {
    @Binding var game: GameLogic
    
    var body: some View {
        HStack {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct ScoreInfoView: View {
    var title: String
    var text: String
    
    var body: some View {
        Color.gray
            .frame(width: 56.0, height: 56.0)
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
    }
}
