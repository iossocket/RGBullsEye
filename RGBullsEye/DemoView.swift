//
//  DemoView.swift
//  RGBullsEye
//
//  Created by ZhuXueliang on 2019/10/17.
//  Copyright © 2019 iossocket. All rights reserved.
//

import SwiftUI

struct DemoView: View {
    var body: some View {
        HStack(spacing: 0) {
            Image("avatar").resizable().aspectRatio(contentMode: .fit).cornerRadius(10).padding()
            ZStack(alignment: .leading) {
                Color(red: 0.5, green: 0.5, blue: 0.5)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Title").bold()
                    Text("This is the latest message").cornerRadius(10).background(Color.red)
                }.padding()
            }
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DemoView().environment(\.colorScheme, .light).previewLayout(.fixed(width: 320, height: 80))
        }
    }
}
