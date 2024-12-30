//
//  CustomTextField.swift
//  Commission Calculator
//
//  Created by Kim on 29.12.2024.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    
    
    var body: some View {
        
        TextField(placeholder, text: $text)
            .keyboardType(.numberPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .frame(width: 170, height: 50)
    }
}
