//
//  SettingsView.swift
//  Commission Calculator
//
//  Created by Kim on 02.01.2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var commission: Int
    var deleteAllData: () -> Void
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Text("Set default commission")
                        .font(.headline)
                    
                    Spacer()
                    
                    CustomTextField(text: Binding(
                        get: { commission == 0 || commission == 20 ? "" : String(commission) },
                        set: { newCommission in
                                commission = Int(newCommission) ?? 0
                        }
                    ), placeholder: "20 %")
                    .frame(width: 120, height: 50)
                    
                }.onTapGesture {
                    dismissKeyboard()
                }
                
                HStack {
                    Text("Reset all data")
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(action: {
                        print("Delete all data")
                        deleteAllData()
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

struct DoubleFormatter {
    static let shared = DoubleFormatter()
    
    func formatted(from input: String) -> Double {
        let sanitizedInput = input.replacingOccurrences(of: ",", with: ".")
        return Double(sanitizedInput) ?? 0.0
    }
}

#Preview {
    SettingsView(commission: .constant(0), deleteAllData: {})
}


/*
 * default commission
 * delete all actual data
 * enable haptics
 * developer info
 * currency
 
 
 */
