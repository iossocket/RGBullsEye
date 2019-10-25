//
//  TargetView.swift
//  RGBullsEye
//
//  Created by ZhuXueliang on 2019/10/25.
//  Copyright © 2019 iossocket. All rights reserved.
//

import SwiftUI

struct MatchColorSubTitleView: View {
    @Binding var showAlert: Bool
    var rTarget: Double
    var gTarget: Double
    var bTarget: Double
    var body: some View {
        showAlert ? Text("R: \(Int(rTarget * 255.0))" + " G: \(Int(gTarget * 255.0))" + " B: \(Int(bTarget * 255.0))")
        : Text("Match this color")
    }
}

struct TargetView: View {
    @Binding var showAlert: Bool
    var rTarget: Double
    var gTarget: Double
    var bTarget: Double
    var body: some View {
        VStack {
            Color(red: rTarget, green: gTarget, blue: bTarget)
            MatchColorSubTitleView(showAlert: $showAlert, rTarget: rTarget, gTarget: gTarget, bTarget: bTarget).frame(width: nil, height: 21.5, alignment: .center)
        }
    }
}

struct TargetView_Previews: PreviewProvider {
    static var previews: some View {
        TargetView(showAlert: .constant(false), rTarget: 0.5, gTarget: 0.5, bTarget: 0.5)
    }
}
