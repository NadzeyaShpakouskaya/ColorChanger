//
//  MainView.swift
//  ColorChanger
//
//  Created by Nadzeya Shpakouskaya on 29/10/2021.
//

import SwiftUI

struct MainView: View {
    enum FocusedField: Hashable {
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
            .alert("Wrong format.\nEnter number from 0 to 255.", isPresented: $isAlertPresenting) {}
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        updateViewOnTextFieldsChange()
                    }
                }
            }
            .onTapGesture {
                updateViewOnTextFieldsChange()
               
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
    
    private func updateViewOnTextFieldsChange() {
        switch focus {
        case .none:
            focus = nil
        case .redInput:
            validateInput(redInputValue, in: .redInput)
        case .greenInput:
            validateInput(greenInputValue, in: .greenInput)
        case .blueInput:
            validateInput(blueInputValue, in: .blueInput)
        }
        endEditing()
    }
    
    private func validateInput(_ input: String, in focusField: FocusedField) {
        if !isInputInColorRange(input) {
            isAlertPresenting.toggle()
            focus = focusField
            return
        }
        switch focus {
        case .none:
            focus = nil
        case .redInput:
                redSliderValue = Double(input) ?? 0
        case .greenInput:
            greenSliderValue = Double(input) ?? 0
        case .blueInput:
            blueSliderValue = Double(input) ?? 0
        }
    }
    
    
}

extension View {
    func isInputInColorRange(_ value: String) -> Bool {
        guard let input = Double(value) else { return false }
        return (0...255).contains(input)
    }
}

extension View {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
