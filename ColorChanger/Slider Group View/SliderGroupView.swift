//
//  SliderGroupView.swift
//  ColorChanger
//
//  Created by Nadzeya Shpakouskaya on 30/10/2021.
//

import SwiftUI


struct GroupSliderView: View {
    
    @Binding var sliderValue: Double
    
    @State private var presentedValue = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            SliderTextView(sliderValue: $sliderValue)
            
            SliderView(sliderValue: $sliderValue, color: color)
                .onChange(of: sliderValue) { _ in
                    presentedValue = String(lround(sliderValue))
                }
            
            SliderTextFieldView(
                sliderValue: $sliderValue,
                displayedValue: $presentedValue,
                color: color
            )
        }
    }
}



struct SliderGroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupSliderView(sliderValue: .constant(245), color: .green)
//        GroupSliderView(sliderValue: .constant(245), presentedValue: .constant("245"), color: .green)
    }
}
