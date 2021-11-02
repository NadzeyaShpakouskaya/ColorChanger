//
//  MainView.swift
//  ColorChanger
//
//  Created by Nadzeya Shpakouskaya on 29/10/2021.
//

import SwiftUI

struct MainView: View {
    
    @FocusState private var isInputActive: Bool
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)

    
    var body: some View {
        ZStack{
            Color.init(white: 0.55).ignoresSafeArea()
            
            VStack(spacing: 16){
                ColorPresentingView(
                    redColorValue: redSliderValue,
                    greenColorValue: greenSliderValue,
                    blueColorValue: blueSliderValue
                )
                slidersView
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isInputActive = false
                    }
                }
            }.onTapGesture {
                isInputActive = false
            }
        }
    }
    
    private var slidersView: some View {
        VStack {
            GroupSliderView(
                sliderValue: $redSliderValue,
                color: .red
            )
            
            GroupSliderView(
                sliderValue: $greenSliderValue,
                color: .green
            )
            
            GroupSliderView(
                sliderValue: $blueSliderValue,
                color: .blue
            )
        }.focused($isInputActive)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
