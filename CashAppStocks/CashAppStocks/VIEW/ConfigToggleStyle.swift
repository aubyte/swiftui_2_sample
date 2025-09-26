//
//  ConfigToggleStyle.swift
//  CashAppStocks
//
//  Created by Alexey L on 9/12/25.
//

import SwiftUI


// Not important, styling for a config view toggle button.
struct ConfigToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.3)) {
                configuration.isOn.toggle()
            }
        } label: {
            HStack {
                Image(systemName: "chevron.right")
                    .foregroundStyle(configuration.isOn ? .primary : .secondary)
                    .imageScale(.large)
                    .rotationEffect(configuration.isOn ? .degrees(90) : .zero)
                configuration.label
            } // HSTACK
        } // BUTTON
    } // FUNC MAKE BODY
    
} // CONFIG TOGGLE STYLE


