//
//  NewsListView.swift
//  CrowTrader
//
//  Created by Никита Кожухов on 22.03.2025.
//

import SwiftUI

struct NewsItem: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var imageName: String
}

struct NewsListView: View {
    
    @StateObject var mainViewModel: MainScreenViewModel
    enum Event {
        case close
    }
    weak var coordinator: NewsListViewEventHandling?
    
    //meta data
    
    let newsItems: [NewsItem] = [
        NewsItem(title: "Breaking News", description: "This is a description for the breaking news.", imageName: "newspaper"),
        NewsItem(title: "Tech Update", description: "Latest advancements in technology.", imageName: "laptopcomputer"),
        NewsItem(title: "Stock Market Update", description: "Today's stock market performance.", imageName: "chart.bar"),
        NewsItem(title: "Weather Report", description: "A look at the weather forecast for the day.", imageName: "cloud.sun")
    ]
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                
                Text("News")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.leading)
                
                List(newsItems) { ads in
                    Button(action: {
                        
                    print("tap on NewsListView")
                        mainViewModel.send(.didTapNewsItem(ads))
                    }) {
                        HStack {
                            
                            Image(systemName: ads.imageName)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.blue)
                                .padding(.trailing, 20)
                            
                            
                            VStack(alignment: .leading) {
                                
                                Text(ads.title)
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                    
                                Text(ads.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .lineLimit(1)
                            }
                        }
                        //
                    }
                }
            }
        }
    }
    
}
