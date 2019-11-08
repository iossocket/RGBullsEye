//
//  ColorUISlider.swift
//  RGBullsEye
//
//  Created by ZhuXueliang on 2019/11/7.
//  Copyright © 2019 iossocket. All rights reserved.
//

import SwiftUI
import UIKit

struct ColorUISlider: UIViewRepresentable {
    var color: UIColor
    @Binding var value: Double
    
    typealias UIViewType = UISlider
    
    func makeUIView(context: UIViewRepresentableContext<ColorUISlider>) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.thumbTintColor = color
        slider.value = Float(value)
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: UIViewRepresentableContext<ColorUISlider>) {
        uiView.value = Float(value)
    }
    
    class Coordinator: NSObject {
        var value: Binding<Double>
        init(value: Binding<Double>) {
            self.value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            self.value.wrappedValue = Double(sender.value)
        }
    }
    
    func makeCoordinator() -> ColorUISlider.Coordinator {
        return Coordinator(value: $value)
    }
}

struct ColorUISlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorUISlider(color: .red, value: .constant(0.5))
    }
}
