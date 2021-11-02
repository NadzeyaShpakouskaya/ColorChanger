//
//  SliderTextFieldView.swift
//  ColorChanger
//
//  Created by Nadzeya Shpakouskaya on 02/11/2021.
//

import SwiftUI

struct SliderTextFieldView: View {
    @Binding var sliderValue: Double
    @Binding var displayedValue: String
    
    @FocusState private var fieldIsFocused
    
    @State private var isAlertPresenting =  false
    @State private var lastEnteredValue: Double = 0
    
    
    
    let color: Color
    
    var body: some View {
        TextField("", text: $displayedValue){ _ in
            validateInput(displayedValue)
        }
            .onSubmit(of: .text) {
                validateInput(displayedValue)
            }
            .keyboardType(.decimalPad)
            .textFieldStyle(.roundedBorder)
            .foregroundColor(color)
            .frame(width: 50)
            .onAppear {
                displayedValue = String(lround(sliderValue))
                lastEnteredValue = sliderValue
            }
            .alert("Wrong format", isPresented: $isAlertPresenting, actions: {}) {
                Text("Please enter number from 0 to 255")
            }
    }
    
}

extension SliderTextFieldView {
    private func validateInput(_ input: String){
        
        if !isInputInColorRange(input) {
            isAlertPresenting.toggle()
            fieldIsFocused = true
            
            // reset value to previous entered value
            displayedValue = String(lround(sliderValue))
        }
        sliderValue = Double(displayedValue) ?? 0
        fieldIsFocused = false
        
    }
    
    private func validateInput() {
        if isInputInColorRange(displayedValue) {
            sliderValue = Double(displayedValue) ?? 0
            fieldIsFocused = false
            print(displayedValue)
        }
        isAlertPresenting.toggle()
        fieldIsFocused = true
        print("entered value is out of range")
    }
    
    private func isInputInColorRange(_ value: String) -> Bool {
        guard let input = Double(value) else { return false }
        return (0...255).contains(input)
    }
}

struct SliderTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SliderTextFieldView(sliderValue: .constant(245), displayedValue: .constant("245"), color: .red)
    }
}
