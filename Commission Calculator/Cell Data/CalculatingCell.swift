//
//  CalculatingCell.swift
//  Commission Calculator
//
//  Created by Kim on 29.12.2024.
//

import SwiftUI

extension View {
    func dismissKeyboard() {
        UIApplication.shared.dismissKeyboard()
    }
    
}

struct CalculatingCellData {
    let commission: Int
    let price: Int
    let quantity: Int
}

struct CalculatingCell: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var inputCommission: Double = 0
    @State private var inputPrice: Double = 0
    @State private var inputQuantity: Double = 0
    @State private var displayedText: String = "0.00"
    var data: CalculatingCellData
    
    var body: some View {
        VStack(alignment: .leading ) {
            HStack {
                Text("Commission: ")
                    .font(.title)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                
                Spacer()
                
                CustomTextField(
                    text: Binding(
                        get: { String(inputCommission) },
                        set: { newValue in
                            if let doubleValue = Double(newValue.replacingOccurrences(of: ",", with: ".")) {
                                inputCommission = doubleValue
                            }
                        }
                    ),
                    placeholder: "0 %")
            }
            
            Divider()
            
            
            HStack {
                Text("Price: ")
                    .font(.headline)
                Spacer()
                
                CustomTextField(text: Binding(
                    get: { String(inputPrice) },
                    set: { newValue in
                        if let doubleValue = Double(newValue.replacingOccurrences(of: ",", with: ".")) {
                            inputPrice = doubleValue
                        }
                    }
                ), placeholder: "0.00")
            }
            
            HStack {
                Text("Quantity: ")
                    .font(.headline)
                Spacer()
                
                CustomTextField(text: Binding(
                    get: { String(inputQuantity) },
                    set: { newValue in
                        if let doubleValue = Double(newValue) {
                            inputQuantity = doubleValue
                        }
                    }
                    
                ), placeholder: "0")
            }
            
            Divider()
            
            
            HStack {
                Button(action: {
                    print("Button pressed")
                    print("Input commission = \(inputCommission)")
                    print("Input price = \(inputPrice)")
                    print("Input quantity = \(inputQuantity)")
                    
                    displayedText = (String((inputPrice - inputPrice/100 * inputCommission) * inputQuantity))
                    dismissKeyboard()
                }) {
                    Text("Calculate")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
                
                Text(String((inputPrice - inputPrice/100 * inputCommission) * inputQuantity))
                    .font(.title)
                    .padding(.horizontal)
            }
        }
        .padding()
        .background(colorScheme == .dark ? Color.black : Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
    }
}

//struct CalculatorCell_Preview: PreviewProvider {
//    static let testData = CalculatingCellData(commission: 20, price: 100, quantity: 5)
//
//    static var previews: some View {
//        CalculatingCell(data: testData)
//    }
//}

#Preview {
    let testData = CalculatingCellData(commission: 20, price: 100, quantity: 5)
    CalculatingCell(data: testData)
}


extension UIApplication {
    func dismissKeyboard(){
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.first { $0.isKeyWindow }?.endEditing(true)
        }
    }
}
