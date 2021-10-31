//
//  MainView.swift
//  ColorChanger
//
//  Created by Nadzeya Shpakouskaya on 29/10/2021.
//

import SwiftUI

struct MainView: View {
    private enum FocusedField: Hashable {
        case redInput, greenInput, blueInput
    }
    
    @FocusState private var focus: FocusedField?
    
    @State private var redSliderValue: Double = Double.random(in: 0...255)
    @State private var greenSliderValue: Double = Double.random(in: 0...255)
    @State private var blueSliderValue: Double = Double.random(in: 0...255)
    
    @State private var redInputValue: String = ""
    @State private var greenInputValue: String = ""
    @State private var blueInputValue: String = ""
    
    @State private var isAlertPresenting: Bool = false
    
    var body: some View {
        ZStack{
            Color.init(white: 0.55).ignoresSafeArea()
            
            VStack(spacing: 16){
                ColorPresentingView(
                    redColorValue: $redSliderValue,
                    greenColorValue: $greenSliderValue,
                    blueColorValue: $blueSliderValue
                )
                slidersView
                Spacer()
            }
            .padding()
            .alert("Wrong format.\nEnter number from 0 to 255.",
                   isPresented: $isAlertPresenting) {}
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        updateSlidersOnTextFieldsChange()
                    }
                }
            }
            .onTapGesture {
                updateSlidersOnTextFieldsChange()
            }
        }
    }
    
    private var slidersView: some View {
        Group {
            GroupSliderView(
                sliderValue: $redSliderValue,
                presentedValue: $redInputValue,
                color: .red
            ).focused($focus, equals: .redInput)
            
            GroupSliderView(
                sliderValue: $greenSliderValue,
                presentedValue: $greenInputValue,
                color: .green
            ).focused($focus, equals: .greenInput)
            
            GroupSliderView(
                sliderValue: $blueSliderValue,
                presentedValue: $blueInputValue,
                color: .blue
            ).focused($focus, equals: .blueInput)
        }
    }
    
    private func updateSlidersOnTextFieldsChange() {
        switch focus {
        case .none:
            focus = nil
        case .redInput:
            if validateInput(redInputValue, in: .redInput) {
                redSliderValue = Double(redInputValue) ?? 0
            }
        case .greenInput:
            if validateInput(greenInputValue, in: .greenInput) {
                greenSliderValue = Double(greenInputValue) ?? 0
            }
        case .blueInput:
            if validateInput(blueInputValue, in: .blueInput) {
                blueSliderValue = Double(blueInputValue) ?? 0
            }
        }
    }
    
    private func validateInput(_ input: String, in focusField: FocusedField) -> Bool {
        if !isInputInColorRange(input) {
            isAlertPresenting.toggle()
            focus = focusField
        } else {
            focus = nil
        }
        return isInputInColorRange(input)
    }
    
}

extension View {
    func isInputInColorRange(_ value: String) -> Bool {
        guard let input = Double(value) else { return false }
        return (0...255).contains(input)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
