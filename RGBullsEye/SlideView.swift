//
//  SlideView.swift
//  RGBullsEye
//
//  Created by ZhuXueliang on 2019/10/17.
//  Copyright © 2019 iossocket. All rights reserved.
//

import SwiftUI

struct SlideView: View {
    @Binding var value: Double
    var textColor: Color
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value).background(textColor) .cornerRadius(10)
            Text("255").foregroundColor(textColor)
        }.padding(.horizontal).frame(width: nil, height: 31, alignment: .center)
    }
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SlideView(value: .constant(0.5), textColor: .red).environment(\.colorScheme, .dark)
            SlideView(value: .constant(0.5), textColor: .red).environment(\.colorScheme, .light)
        }
    }
}
