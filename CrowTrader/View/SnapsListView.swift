//
//  SnapsListView.swift
//  CrowTrader
//
//  Created by Никита Кожухов on 23.03.2025.
//

import SwiftUI

struct SnapsListView: View {
    @ObservedObject var viewModel: SnapsViewModel
    
    var body: some View {
            VStack {
                if viewModel.stockItems.isEmpty {
                    Text("No stock items available")
                        .font(.headline)
                        .foregroundColor(.gray)
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.stockItems) { stockItem in
                                Text(stockItem.title)
                                Divider()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Stock Items")
        }
    
}
