//
//  LeaderboardView.swift
//  SwiftUIFundamentals
//
//  Created by My3 Shenoy on 12/7/21.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack {
                HeaderView()
                LabelView()
                RowView(index: 1, score: 10, date: Date())
            }
        }
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

struct HeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "Leaderboard")
                }
            }
            HStack {
                Spacer()
                Button(action: {}) {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderboardConstants.leaderboardMaxRowWidth)
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            AlertBodyText(text: "Score")
                .frame(width: Constants.LeaderboardConstants.leaderboardScoreColWidth)
            Spacer()
            AlertBodyText(text: "Date")
                .frame(width: Constants.LeaderboardConstants.leaderboardDateColWidth)
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LeaderboardView()
                .previewDevice("iPhone 11 Pro")
            LeaderboardView()
        }
    }
}
