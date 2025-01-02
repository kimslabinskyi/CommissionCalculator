//
//  CommissionList.swift
//  Commission Calculator
//
//  Created by Kim on 30.12.2024.
//

import SwiftUI

struct CommissionList: View {
    //var commission = 20
    let items: [CalculatingCellData] = [
        CalculatingCellData(commission: 20, price: 555, quantity: 1),
        CalculatingCellData(commission: 20, price: 555, quantity: 1),
        CalculatingCellData(commission: 20, price: 555, quantity: 1),
        CalculatingCellData(commission: 20, price: 555, quantity: 1),
        CalculatingCellData(commission: 20, price: 555, quantity: 1)

    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(items.indices, id:\.self) { index in
                    CalculatingCell(data: items[index])
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                        .padding(.vertical, 10)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(PlainListStyle())
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    CommissionList()
}
