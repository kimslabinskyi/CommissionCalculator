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
    @State private var inputCommission: String = ""
    @State private var inputPrice: String = ""
    @State private var inputQuantity: String = ""
    var data: CalculatingCellData
    
    var body: some View {
            VStack(alignment: .leading ) {
                HStack {
                    Text("Commission: ")
                        .font(.title)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)

                            Spacer()
                    
                    CustomTextField(text: $inputCommission, placeholder: "0 %")
                }
                
                Divider()
                
                
                HStack {
                    Text("Price: ")
                        .font(.headline)
                    Spacer()
                    
                    CustomTextField(text: $inputPrice, placeholder: "0.00")
                }
                
                HStack {
                    Text("Quantity: ")
                        .font(.headline)
                    Spacer()
                    
                    CustomTextField(text: $inputQuantity, placeholder: "0")
                }
                
                Divider()
                
                
                HStack {
                    Button(action: {
                        print("Button pressed")
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
                    
                    Text("666.66")
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
