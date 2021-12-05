//
//  Shapes.swift
//  SwiftUIFundamentals
//
//  Created by My3 Shenoy on 12/5/21.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack {
            Circle()
            //    .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
            //    .inset(by: 10.0)
            //    .stroke(Color.gray, lineWidth: 10.0)
            
            // Stroke + Inset = Stroke Border
                .strokeBorder(Color.blue, lineWidth: 20.0)
                .frame(width: 200, height: 100)
            
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.cyan)
            Capsule()
                .fill(Color.yellow)
            Ellipse()
                .fill(Color.pink)
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
