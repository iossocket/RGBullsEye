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
    @ObservedObject var counter: TimeCounter
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    @State var showAlert: Bool
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TargetView(showAlert: $showAlert, rTarget: rTarget, gTarget: gTarget, bTarget: bTarget)
                    MatchingView(rGuess: $rGuess, gGuess: $gGuess, bGuess: $bGuess, counter: $counter.counter)
                }
                Button(action: { self.showAlert = true }) {
                    Text("Hit me")
                }.alert(isPresented: $showAlert) { () -> Alert in
                    Alert(title: Text("Your Score"),message: Text(String(computeScore())))
                }.frame(width: nil, height: 35, alignment: .center)
                SlideView(value: $rGuess, textColor: .red)
                SlideView(value: $gGuess, textColor: .green)
                SlideView(value: $bGuess, textColor: .blue)
                ColorUISlider(color: .red, value: .constant(0.5))
                NavigationLink(destination: ViewControllerRepresentation()) {
                    Text("Play BullsEye").frame(width: nil, height: 31, alignment: .center)
                }.padding(.bottom)
            }
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
        Group {
            ContentView(counter: TimeCounter(), rGuess: 0.7, gGuess: 0.3, bGuess: 0.6, showAlert: false).environment(\.colorScheme, .dark)
            //.previewLayout(.fixed(width: 568, height: 320))
            ContentView(counter: TimeCounter(), rGuess: 0.7, gGuess: 0.3, bGuess: 0.6, showAlert: false).environment(\.colorScheme, .light)
            //.previewLayout(.fixed(width: 568, height: 320))
        }
    }
}
