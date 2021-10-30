//
//  SliderGroupView.swift
//  ColorChanger
//
//  Created by Nadzeya Shpakouskaya on 30/10/2021.
//

import SwiftUI

struct SliderGroupView: View {
    @Binding var sliderValue: Double
    @Binding var inputValue: String
    
    let color: Color
    
    var body: some View {
        HStack(spacing: 8) {
            Text("\(lround(sliderValue))").bold()
                .frame(width: 50).foregroundColor(.white)
            Slider(value: $sliderValue, in: 0...255, step: 1).accentColor(color)
            TextField(inputValue, value: $sliderValue, formatter: NumberFormatter())
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(color)
                .frame(width: 50)
        }
    }
}

//struct SliderGroupView_Previews: PreviewProvider {
//    static var previews: some View {
//        SliderGroupView(sliderValue: Binding<20.0>, inputValue: Binding<"">)
//    }
//}
