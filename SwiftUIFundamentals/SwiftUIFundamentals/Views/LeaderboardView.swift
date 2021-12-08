//
//  LeaderboardView.swift
//  SwiftUIFundamentals
//
//  Created by My3 Shenoy on 12/7/21.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        RowView(index: 1, score: 10, date: Date())
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedRectTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.LeaderboardConstants.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.LeaderboardConstants.leaderboardDateColWidth)
            
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderboardConstants.leaderboardMaxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
