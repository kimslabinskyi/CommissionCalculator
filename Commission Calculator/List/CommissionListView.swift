//
//  CommissionList.swift
//  Commission Calculator
//
//  Created by Kim on 30.12.2024.
//

import SwiftUI

struct CommissionListView: View {
    @FocusState private var focusedIndex: Int?
    @Environment(\.colorScheme) var colorScheme
    @State private var items: [CalculatingCellData] = [
        CalculatingCellData(id: UUID(), price: 0, quantity: 1, result: 0)
    ]
    @State private var commission: Int = 20
    @State private var showSettingView: Bool = false
    var totalSum: Double {
        items.reduce(0) { $0 + $1.result }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                if !showSettingView {
                        List {
                            ForEach(items.indices, id: \.self) { index in
                                CommissionRow(row: $items[index], commission: commission)
                                    .listRowInsets(EdgeInsets())
                                    .listRowBackground(Color.clear)
                                    .padding(.vertical, 10)
                                    .listRowSeparator(.hidden)
                                    .transition(.slide)
                                    .focused($focusedIndex, equals: index)
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
                
                
                if showSettingView {
                    SettingsView(commission: $commission, deleteAllData: {
                        items.removeAll()
                        items.append(CalculatingCellData(price: 0, quantity: 1, result: 0))
                    })
                    .transition(.move(edge: .trailing))
                }
            }
            .animation(.easeInOut, value: showSettingView)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Balance: \(totalSum, specifier: "%.2f")")
                        .font(.system(size: 24, weight: .bold, design: .default))
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showSettingView.toggle()
                    } label: {
                        Image(systemName: "gear")
                            .imageScale(.large)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            print(items)
                            items.append(CalculatingCellData(price: 0.0, quantity: 1, result: 0.0))
                            focusedIndex = items.count - 1
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
    
    
    var gradientColors: [Color] {
        colorScheme == .dark
        ? [Color.green, Color.black.opacity(0)]
        : [Color.white.opacity(0.3), Color.green]
        
    }
    
}

#Preview {
    CommissionListView()
}
