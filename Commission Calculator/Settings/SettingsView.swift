//
//  SettingsView.swift
//  Commission Calculator
//
//  Created by Kim on 02.01.2025.
//

import SwiftUI

struct SettingsView: View {
    @State private var showingSheet = false
    @Binding var commission: Int
    var deleteAllData: () -> Void
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Text("Set default commission (%)")
                        .font(.headline)
                        .padding(.horizontal)
                    Spacer()
                    
                    CustomTextField(text: Binding(
                        get: { String(commission) },
                        set: { newCommission in
                            commission = Int(newCommission) ?? 0
                        }
                    ), placeholder: "")
                    .frame(width: 120, height: 50)
                    .padding(.horizontal)
                    
                }.onTapGesture {
                    dismissKeyboard()
                }
                
                HStack {
                    Text("Reset all data")
                        .font(.headline)
                        .padding(.horizontal)
                    Spacer()
                    
                    Button(action: {
                        print("Delete all data")
                        deleteAllData()
                    }, label: {
                        Text("Reset")
                    })
                    .font(.headline)
                    .padding(.horizontal)

                    
                    
                }
                
                HStack {
                    Text("Developer info")
                        .font(.headline)
                        .padding(.horizontal)
                    Spacer()
                    
                    
                    Button("Show") {
                        showingSheet = true
                    }
                    .font(.headline)
                    .padding(.horizontal)
                    .sheet(isPresented: $showingSheet) {
                        DeveloperInfoView()
                            .presentationDetents([.medium])
                    }
                    
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


struct DeveloperInfoView: View {
    var body: some View {
        
        VStack(spacing: 50) {
            HStack{
                Text("Developer Name:")
                    .font(.headline)
                
                Spacer()
                
                Text("Kim Slabinskyi")
                    .font(.title3)
                    .bold()
            }
            
            HStack {
                Text("Email:")
                    .font(.headline)
                
                Spacer()
                
                Text("kim.slabinskyi@gmail.com")
                    .font(.title3)
                    .bold()
            }
            
            Text("This application created for convenient commission calculation for online stores, and other services. Build with SwiftUI and Xcode 16.2. If you have any questions, or suggestions, write to my email.")
            
            
            Button("Close") {
                dismiss()
                
            }
            .padding()
            .bold()
            .foregroundColor(.red)
            
        }
        .padding()
    }
    
    @Environment(\.dismiss) private var dismiss
    
    
}


