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

struct CalculatingCellData: Identifiable, Equatable {
    var id = UUID()
    var value: Double
}

struct CommissionRow: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var sum: CalculatingCellData
    @State private var inputPrice: Double = 0
    @State private var inputQuantity: Int = 1
    @State private var value: Double = 0
    var totalSum: Double {
        print("Calculate")
        return (inputPrice - inputPrice / 100 * commission) * Double(inputQuantity)
    }
    
    let commission: Double
    
    var body: some View {
        VStack(alignment: .leading ) {
           HStack {
                Text("Price: ")
                    .font(.headline)
                Spacer()
                
                CustomTextField(text: Binding(
                    get: { inputPrice == 0 ? "" : String(inputPrice) },
                    set: { newValue in
                        inputPrice = parseInputValue(from: newValue)
                        sum.value = totalSum
                    }
                ), placeholder: "0.00")
                .frame(width: 170, height: 50)
            }
            
            HStack {
                Text("Quantity: ")
                    .font(.headline)
                Spacer()
                
                CustomTextField(text: Binding(
                    get: { inputQuantity == 1 ? "" : String(inputQuantity) },
                    set: { newValue in
                        if let intValue = Int(newValue) {
                            inputQuantity = intValue
                            sum.value = totalSum
                        }
                    }
                    
                ), placeholder: "1")
                .frame(width: 170, height: 50)
            }
            
            Divider()
            
            
            HStack {
                Button(action: {
                    dismissKeyboard()
                   let newValue = (inputPrice - inputPrice/100 * commission) * Double(inputQuantity)
                   sum.value = newValue
                    
                }) {
                    Text("Sum")
                        .bold()
                        .font(.headline)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                if inputQuantity != 0 && inputQuantity != 1 {
                    Text(String(format: "%.2f", (totalSum / Double(inputQuantity))))
                        .font(.subheadline)
                        .padding(.vertical)
                }
                
                Text(String(format: "%.2f", (totalSum)))
                    .font(.title)
                    .padding(.horizontal)
            }
            
        }
        .padding()
        .background(colorScheme == .dark ? Color.black : Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
    }
    
    private func parseInputValue(from input: String) -> Double {
        let sanitizedInput = input.replacingOccurrences(of: ",", with: ".")
        return Double(sanitizedInput) ?? 0.0
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
    struct Preview: View {
        @State var testData = CalculatingCellData(id: UUID(), value: 4.44)
        var body: some View {
            CommissionRow(sum: $testData, commission: 20)
        }
    }
    return Preview()
}


extension UIApplication {
    func dismissKeyboard(){
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.first { $0.isKeyWindow }?.endEditing(true)
        }
    }
}
