//
//  CustomTextField.swift
//  Commission Calculator
//
//  Created by Kim on 29.12.2024.
//

import SwiftUI

struct CustomTextField: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var text: String
    let placeholder: String
    
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = "."
        return formatter
    }()
    
    var body: some View {
        TextField(placeholder, text: $text)
            .keyboardType(.decimalPad)
            .padding()
            .background(colorScheme == .dark ? Color.gray.opacity(0.5) : Color.white)
            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.secondary, lineWidth: 1)
            )
            .onTapGesture {
                text = ""
            }
    }
}
