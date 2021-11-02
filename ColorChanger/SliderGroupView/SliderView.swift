//
//  SliderView.swift
//  ColorChanger
//
//  Created by Nadzeya Shpakouskaya on 02/11/2021.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    let color: Color
    
    var body: some View {
        Slider(value: $sliderValue, in: 0...255, step: 1)
            .accentColor(color)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(245), color: .red)
    }
}
