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
    
    @State private var isAlertPresenting = false
    
    let color: Color
    
    var body: some View {
        TextField("", text: $displayedValue) { _ in
            validateInput()
        }
            .keyboardType(.decimalPad)
            .textFieldStyle(.roundedBorder)
            .foregroundColor(color)
            .frame(width: 50)
            .alert("Wrong format", isPresented: $isAlertPresenting, actions: {}) {
            Text("Please enter number from 0 to 255")
        }
    }
}

extension SliderTextFieldView {
    private func validateInput(){
        if !isInputInColorRange(displayedValue) {
            isAlertPresenting.toggle()
            sliderValue = 0
            displayedValue = ""
        }
        sliderValue = Double(displayedValue) ?? 0
    }
    
    private func isInputInColorRange(_ value: String) -> Bool {
        guard let input = Double(value) else { return false }
        return (0...255).contains(input)
    }
}

struct SliderTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SliderTextFieldView(sliderValue: .constant(245), displayedValue: .constant("245"), color: .green)
    }
}
