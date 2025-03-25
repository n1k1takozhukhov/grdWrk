//
//  TabController.swift
//  CrowTrader
//
//  Created by Никита Кожухов on 23.03.2025.
//

import SwiftUI

struct TabController: View {
    
    @State private var selection = 1
    @StateObject var viewModel: MainScreenViewModel
    @StateObject var newsListScreenViewModel: NewsSceneViewModel
    @StateObject var snapsViewModel: SnapsViewModel
    
    enum Event {
        case close
    }
    weak var coordinator: TabControllerEventHandling?
    
    var body: some View {
         
        TabView(selection: $selection) {
            
            MainPageView(viewModel: viewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }.tag(1)
            
            WatchListView()
                .tabItem {
                    Label("WatchList", systemImage: "eye")
                }.tag(2)
            SnapsListView(viewModel: snapsViewModel)
                .tabItem {
                    Label("Snaps", systemImage: "chart.bar")
                }.tag(3)
            NewsListView(viewModel: newsListScreenViewModel)
                .tabItem {
                    Label("News", systemImage: "book")
                }.tag(4)
        }
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                
                HStack {
                    Image(systemName: "eye")
                        .foregroundStyle(Color.green)
                    
                    Text("Traider App")
                        .font(.headline)
                        .foregroundColor(Color.green)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .onAppear {
            
        }
    }
    
}
