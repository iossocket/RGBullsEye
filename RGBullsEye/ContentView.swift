//
//  ContentView.swift
//  RGBullsEye
//
//  Created by ZhuXueliang on 2019/10/12.
//  Copyright © 2019 iossocket. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    @State var showAlert: Bool
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Color(red: rTarget, green: gTarget, blue: bTarget)
                    Text("Match the color")
                }
                VStack {
                    Color(red: rGuess, green: gGuess, blue: bGuess)
                    Text("R: \(Int(rGuess * 255))  G: \(Int(gGuess * 255))  B: \(Int(bGuess * 255))")
                }
            }
            Button(action: { self.showAlert = true }) {
                Text("Hit me")
            }.alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text("Your Score"),message: Text(String(computeScore())))
            }.padding()
            ExtractedView(value: $rGuess, textColor: .red)
            ExtractedView(value: $gGuess, textColor: .green)
            ExtractedView(value: $bGuess, textColor: .blue)
        }
    }
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.7, gGuess: 0.3, bGuess: 0.6, showAlert: false)//.previewLayout(.fixed(width: 568, height: 320))
    }
}

struct ExtractedView: View {
    @Binding var value: Double
    var textColor: Color
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value)
            Text("255").foregroundColor(textColor)
        }.padding(.horizontal)
    }
}
