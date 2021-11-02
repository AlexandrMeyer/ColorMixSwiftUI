//
//  ContentView.swift
//  ColorMixSwiftUI
//
//  Created by Александр on 29.10.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        ZStack {
            Color.indigo.ignoresSafeArea()
            
            VStack(spacing: 40) {
                ColorView(red: red, green: green, blue: blue)
                
                VStack {
                    ColorSliderView(sliderValue: $red, color: .red)
                    ColorSliderView(sliderValue: $green, color: .green)
                    ColorSliderView(sliderValue: $blue, color: .blue)
                }
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
