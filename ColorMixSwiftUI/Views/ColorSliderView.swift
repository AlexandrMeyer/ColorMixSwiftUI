//
//  ColorSliderView.swift
//  ColorMixSwiftUI
//
//  Created by Александр on 29.10.21.
//

import SwiftUI

struct ColorSliderView: View {
    
    @Binding var sliderValue: Double
    @State private var textValue = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            ColorValueTextView(value: sliderValue)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(color)
            // в реальном времени передаю значения из слайдера в тесктовое поле
                .onChange(of: sliderValue) { isOnFocus in
                    textValue = "\(lround(isOnFocus))"
                }
            
            ColorValueTFView(textValue: $textValue, value: $sliderValue)
        }
        .onAppear {
            textValue = "\(lround(sliderValue))"
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ColorSliderView(sliderValue: .constant(100), color: .red)
        }
    }
}
