//
//  MainPageView.swift
//  CrowTrader
//
//  Created by Никита Кожухов on 22.03.2025.
//

import SwiftUI
import Charts

struct StockItem: Identifiable {
    var id = UUID()
    var title: String
    var price: String
}

struct MainPageView: View {
    
    @StateObject var viewModel: MainScreenViewModel
    //meta data
    var stockItems = StockItem(title: "remove this", price: "433")
    
    
    var body: some View {
        
        VStack {
            Button(action: { viewModel.send(.didTapStockPreview(stockItems))}) {
                Text("try detail stock")
            }
            
            TextField("Message text", text: $viewModel.messageText)
            DatePicker("Date", selection: $viewModel.datePicker)
            
            Button("Show last 5 open prices from yahoo API (btc-usd) bbb") {
                viewModel.fetchData()
            }
            Text(viewModel.temperature)
        }
        .padding()
        .ignoresSafeArea()
    }
}
