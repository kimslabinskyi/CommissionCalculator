//
//  CalculatingCell.swift
//  Commission Calculator
//
//  Created by Kim on 29.12.2024.
//

import SwiftUI

struct CalculatingCellData {
    let commission: Int
    let price: Int
    let quantity: Int
}

struct CalculatingCell: View {
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
                    
                    CustomTextField(placeholder: "0 %", text: $inputCommission)
                }
                
                Divider()
                
                
                HStack {
                    Text("Price: ")
                        .font(.headline)
                    Spacer()
                    
                    CustomTextField(placeholder: "0.00", text: $inputPrice)
                }
                
                HStack {
                    Text("Quantity: ")
                        .font(.headline)
                    Spacer()
                    
                    CustomTextField(placeholder: "0", text: $inputQuantity)
                }
                
                Divider()
                
                
                HStack {
                    Text("Total: ")
                        .font(.title)
                    
                    Spacer()
                    
                    Text("666.66")
                        .font(.title)
                        .padding(.horizontal)
                }
            }
            .padding()
            .background(Color.green)
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
