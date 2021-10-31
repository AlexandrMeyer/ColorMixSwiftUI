//
//  ContentView.swift
//  ColorMixSwiftUI
//
//  Created by Александр on 29.10.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    @State private var redTextField = ""
    @State private var greenTextField = ""
    @State private var blueTextField = ""
    
    @FocusState private var amountIsFocused: Bool
    
    private var color: Color {
        Color(
            red: redSliderValue / 255,
            green: greenSliderValue / 255,
            blue: blueSliderValue / 255
        )
    }
    
    var body: some View {
        ZStack {
            Color.indigo.ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(color)
                    .frame(width: 300, height: 120)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 4))
                SliderView(sliderValue: $redSliderValue, tintColor: .red)
                SliderView(sliderValue: $greenSliderValue, tintColor: .green)
                SliderView(sliderValue: $blueSliderValue, tintColor: .blue)
                Spacer()
            }
            .focused($amountIsFocused)
            .padding()
        }
        .onTapGesture {
            hideKeyboard()
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    amountIsFocused = false
                }
            }
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
