//
//  CommissionList.swift
//  Commission Calculator
//
//  Created by Kim on 30.12.2024.
//

import SwiftUI

struct CommissionList: View {
    @Environment(\.colorScheme) var colorScheme
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
            .background(
                LinearGradient(gradient: Gradient(colors: gradientColors),
                               startPoint: .top,
                               endPoint: .bottom)
                )
        }
    }
    
    var gradientColors: [Color] {
        colorScheme == .dark
        ? [Color.green, Color.black.opacity(0)]
        : [Color.gray.opacity(0.3), Color.green]
        
    }
    
}

#Preview {
    CommissionList()
}
