//
//  SliderView.swift
//  ColorMixSwiftUI
//
//  Created by Александр on 29.10.21.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var sliderValue: Double
    
    let tintColor: Color
    let formatter = NumberFormatter()
    
    var body: some View {
        HStack {
            Text("\(lround(sliderValue))")
                .foregroundColor(.white)
                .frame(width: 40)
            Slider(value: $sliderValue, in: 0...255)
                .tint(tintColor)
            TextField("", value: $sliderValue, formatter: formatter)
                .background(Color(white: 0.95))
                .frame(width: 45)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
        }
        .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
    }
}
