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
    
    var stockItem = StockItem(title: "remove this", price: "443")

    var body: some View {
            
        VStack {
            Button(action: {viewModel.send(.didTapStockPreview(stockItem))}){
                Text("try detail stock")
            }
            TextField("Message text", text: $viewModel.messageText)
            DatePicker("Date", selection: $viewModel.messageDate)

            Button("test search"){
                viewModel.fetchSearch(symbol: "BTC-USD")
            }
            Text(viewModel.testSearch)
            
            Button("test chart"){
                viewModel.fetchChart(symbol: "BTC-USD")
            }
            Text(viewModel.testChart)
            
            Button("test info"){
                viewModel.fetchInfo(symbol: "BTC-USD")
            }
            Text(viewModel.testInfo)
            
            Divider()
            
            Button("test news"){
                viewModel.fetchNews()
            }
            Text(viewModel.testNews)
            
            Divider()
            
            Button("test movers"){
                viewModel.fetchMarketMovers(top: 5)
            }
            Text(viewModel.testMovers)
        }
        .padding()
        .ignoresSafeArea()
    }
}
