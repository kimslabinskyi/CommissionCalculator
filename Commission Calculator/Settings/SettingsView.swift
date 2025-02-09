//
//  SettingsView.swift
//  Commission Calculator
//
//  Created by Kim on 02.01.2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var commission: Double
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Text("Set default commission")
                        .font(.headline)
                    
                    Spacer()
                    
                    CustomTextField(text: Binding(
                        get: { commission == 0 ? "" : String(commission) },
                        set: { newCommission in
                            if let doubleValue = Double(newCommission) {
                                commission = doubleValue
                            }
                        }
                    ), placeholder: "0 %")
                    .frame(width: 120, height: 50)
                }.onTapGesture {
                    dismissKeyboard()
                }
                
                HStack {
                    Text("Reset all data")
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(action: {
                        print("Reset all data")
                        
                    }, label: {
                        Text("Reset")
                    }) .padding()
                    
                    
                }
                
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Settings")
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    SettingsView(commission: .constant(0.0))
}


/*
 * default commission
 * delete all actual data
 * enable haptics
 * developer info
 * currency
 
 
 */
