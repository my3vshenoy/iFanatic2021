//
//  TextViews.swift
//  SwiftUIFundamentals
//
//  Created by My3 Shenoy on 12/4/21.
//

import SwiftUI

struct InstructionText: View {
    let text: String
    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("TextColor")) // Asset Catalog
            .kerning(2.0)
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .font(.footnote)
    }
}

struct BigNumberText: View {
    let text: String
    var body: some View {
        Text(text)
            .bold()
            .kerning(-1)
            .fontWeight(.black)
            .font(.largeTitle)
    }
}

struct SliderLabelText: View {
    let text: String
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor")) // Asset Catalog
            .fontWeight(.black)
    }
}

struct ButtonText: View {
    var text: String
    var body: some View {
        // Bold the text, not the button
        Text(text.uppercased())
            .bold()
            .font(.title)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            SliderLabelText(text: "99")
            ButtonText(text: "Button Text")
        }
    }
}
