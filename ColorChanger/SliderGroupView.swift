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

struct SliderView: View {
    @Binding var sliderValue: Double
    let color: Color
    
    var body: some View {
        Slider(value: $sliderValue, in: 0...255, step: 1)
            .accentColor(color)
    }
}

struct SliderTextFieldView: View {
    @Binding var sliderValue: Double
    @Binding var displayedValue: String
    let color: Color
    
//    let action: () -> Void
    var body: some View {
        TextField("", text: $displayedValue)
            .keyboardType(.decimalPad)
            .textFieldStyle(.roundedBorder)
            .foregroundColor(color)
            .frame(width: 50)
            .onAppear {
                displayedValue = String(lround(sliderValue))
            }
        
//        TextField("", value: $sliderValue, formatter: NumberFormatter())
//            .onSubmit {
//                if !isInputInColorRange(sliderValue) {
//                    //show alert
//                    isAlertPresented.toggle()
//                    print("Input is out of range")
//                    sliderValue = 0
//                }
//            }
//            .keyboardType(.decimalPad)
//            .textFieldStyle(.roundedBorder)
//            .foregroundColor(color)
//            .frame(width: 50)
           
    }
    
    
}

struct SliderTextView: View {
    @Binding var sliderValue: Double

    
    var body: some View {
        Text("\(lround(sliderValue))")
            .bold()
            .frame(width: 50)
            .foregroundColor(.white)
    
    }
}


struct GroupSliderView: View {
    @Binding var sliderValue: Double
    @Binding var presentedValue: String

    let color: Color

    
    var body: some View {
        HStack {
            SliderTextView(sliderValue: $sliderValue)
            SliderView(sliderValue: $sliderValue, color: color)
                .onChange(of: sliderValue) { _ in
                    presentedValue = String(lround(sliderValue))
                }
            SliderTextFieldView(sliderValue: $sliderValue, displayedValue: $presentedValue, color: color)
//            SliderTextFieldView(sliderValue: $sliderValue, color: color)
        }
    }
}



//struct SliderGroupView_Previews: PreviewProvider {
//    static var previews: some View {
//        SliderGroupView(sliderValue: Binding<20.0>, inputValue: Binding<"">)
//    }
//}
