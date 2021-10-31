//
//  ColorPresentingView.swift
//  ColorChanger
//
//  Created by Nadzeya Shpakouskaya on 30/10/2021.
//

import SwiftUI


struct ColorPresentingView: View {
    @Binding var redColorValue: Double
    @Binding var greenColorValue: Double
    @Binding var blueColorValue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12).frame(height: 160)
            .foregroundColor(
                Color(red: redColorValue / 255,
                      green: greenColorValue / 255,
                      blue: blueColorValue / 255)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.white, lineWidth: 5)
            )

    }
}

//struct ColorPresentingView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorPresentingView()
//    }
//}
