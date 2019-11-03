//
//  MatchingView.swift
//  RGBullsEye
//
//  Created by ZhuXueliang on 2019/10/25.
//  Copyright © 2019 iossocket. All rights reserved.
//

import SwiftUI

struct MatchingView: View {
    @Binding var rGuess: Double
    @Binding var gGuess: Double
    @Binding var bGuess: Double
    @Binding var counter: Int
    var body: some View {
        VStack {
            ZStack {
                Color(red: rGuess, green: gGuess, blue: bGuess)
                Text("\(counter)").padding(.all, 5).background(Color.white).mask(Circle()).foregroundColor(.black)
            }
            Text("R: \(Int(rGuess * 255))  G: \(Int(gGuess * 255))  B: \(Int(bGuess * 255))").frame(width: nil, height: 21.5, alignment: .center)
        }
    }
}

struct MatchingView_Previews: PreviewProvider {
    static var previews: some View {
        MatchingView(rGuess: .constant(0.5), gGuess: .constant(0.5), bGuess: .constant(0.5), counter: .constant(60))
    }
}
