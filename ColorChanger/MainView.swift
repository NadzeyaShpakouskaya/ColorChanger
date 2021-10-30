//
//  MainView.swift
//  ColorChanger
//
//  Created by Nadzeya Shpakouskaya on 29/10/2021.
//

import SwiftUI

struct MainView: View {
    @State private var presentedColor: Color = .gray
    
    @State private var redSliderValue: Double = Double.random(in: 0...255)
    @State private var greenSliderValue: Double = Double.random(in: 0...255)
    @State private var blueSliderValue: Double = Double.random(in: 0...255)
    
    @State private var isRedSliderChanged: Bool = false
    @State private var isGreenSliderChanged: Bool = false
    @State private var isBlueSliderChanged: Bool = false
    
    @State private var redInputValue: String = ""
    @State private var greenInputValue: String = ""
    @State private var blueInputValue: String = ""
    
    var body: some View {
        ZStack{
            Color.init(white: 0.55).ignoresSafeArea()
            
            VStack(spacing: 16){
                ColorPresentingView(redColorValue: $redSliderValue, greenColorValue: $greenSliderValue, blueColorValue: $blueSliderValue)
                SliderGroupView(sliderValue: $redSliderValue, inputValue: $redInputValue, color: .red)
                SliderGroupView(sliderValue: $greenSliderValue, inputValue: $greenInputValue, color: .green)
                SliderGroupView(sliderValue: $blueSliderValue, inputValue: $blueInputValue, color: .blue)
                
                Spacer()
            }.padding()
        }
        
    }
    
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
