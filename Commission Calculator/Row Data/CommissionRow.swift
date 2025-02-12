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
    var price: Double
    var quantity: Int
    var result: Double
}

struct CommissionRow: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var row: CalculatingCellData
    let commission: Int
    var totalSum: Double {
        print("Calculate")
        return (row.price - row.price / 100 * Double(commission)) * Double(row.quantity)
    }
    
    var body: some View {
        VStack(alignment: .leading ) {
           HStack {
                Text("Price: ")
                    .font(.headline)
                Spacer()
                
                CustomTextField(text: Binding(
                    get: { row.price == 0 ? "" : String(row.price) },
                    set: { newValue in
                        print("row.price = \(row.price)")
                        print("newValue = \(newValue)")
                        row.price = DoubleFormatter.shared.formatted(from: newValue)
                        row.result = totalSum
                    }
                ), placeholder: "0.00")
                .frame(width: 170, height: 50)
                .onAppear(){
                    row.result = totalSum
                }
            }
            
            HStack {
                Text("Quantity: ")
                    .font(.headline)
                Spacer()
                
                CustomTextField(text: Binding(
                    get: { row.quantity == 1 ? "" : String(row.quantity) },
                    set: { newValue in
                        if let intValue = Int(newValue) {
                            row.quantity = intValue
                            row.result = totalSum
                        }
                    }
                    
                ), placeholder: "1")
                .frame(width: 170, height: 50)
            }
            
            Divider()
            
            
            HStack {
                Button(action: {
                    dismissKeyboard()
                }) {
                    Text("Sum")
                        .bold()
                        .font(.headline)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                if row.quantity != 0 && row.quantity != 1 {
                    Text(String(format: "%.2f", (totalSum / Double(row.quantity))))
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
        @State var testData = CalculatingCellData(id: UUID(), price: 0, quantity: 1, result: 4.44)
        var body: some View {
            CommissionRow(row: $testData, commission: 20)
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
