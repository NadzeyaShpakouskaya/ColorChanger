//
//  SliderTextView.swift
//  ColorChanger
//
//  Created by Nadzeya Shpakouskaya on 02/11/2021.
//

import SwiftUI

struct SliderTextView: View {
    
    @Binding var sliderValue: Double
    
    var body: some View {
        Text("\(lround(sliderValue))")
            .bold()
            .frame(width: 50)
            .foregroundColor(.white)
    }
}



struct SliderTextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.gray
            SliderTextView(sliderValue: .constant(245))
        }
    }
}
