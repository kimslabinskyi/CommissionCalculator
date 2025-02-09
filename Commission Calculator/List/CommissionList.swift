//
//  CommissionList.swift
//  Commission Calculator
//
//  Created by Kim on 30.12.2024.
//

import SwiftUI

struct CommissionList: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var items: [CalculatingCellData] = [
        CalculatingCellData(value: 0.0)
    ]
    @State private var commission: Double = 20
    var totalSum: Double {
        items.reduce(0) { $0 + $1.value }
    }
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(items.indices, id: \.self) { index in
                        CommissionRow(data: $items[index], commission: commission)
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                            .padding(.vertical, 10)
                            .listRowSeparator(.hidden)
                            .transition(.slide)
                    }.onDelete { indexSets in
                        items.remove(atOffsets: indexSets)
                    }
                }
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
                .background(
                    LinearGradient(gradient: Gradient(colors: gradientColors),
                                   startPoint: .top,
                                   endPoint: .bottom))
                .animation(.default, value: items)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Balance: \(totalSum, specifier: "%.2f")")
                        .font(.system(size: 24, weight: .bold, design: .default))
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: SettingsView(commission: $commission)) {
                        Image(systemName: "gear")
                            .imageScale(.large)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            print(items)
                            items.append(CalculatingCellData(value: 0.0))
                        }
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
//    private func deleteAllRows(){
//        items.removeAll()
//        items.append(CalculatingCellData(value: 0.0))
//    }
    
    var gradientColors: [Color] {
        colorScheme == .dark
        ? [Color.green, Color.black.opacity(0)]
        : [Color.white.opacity(0.3), Color.green]
        
    }
    
}

#Preview {
    CommissionList()
}
