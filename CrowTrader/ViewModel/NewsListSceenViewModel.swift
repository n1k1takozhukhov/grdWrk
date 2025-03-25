//
//  NewsListSceenViewModel.swift
//  CrowTrader
//
//  Created by Никита Кожухов on 24.03.2025.
//

import Foundation

class NewsSceneViewModel: ObservableObject {
    
    @Published var newsItems: [NewsItem] = []
    private weak var coordinator: NewsListViewEventHandling?
    let apiManager: APIManaging
    
    
    init(coordinator: NewsListViewEventHandling? = nil, apiManager: APIManaging) {
        self.coordinator = coordinator
        self.apiManager = apiManager
    }
    
    
    func send(_ action: NewsListSceenViewModelAction) {
        switch action {
        case .didTapNewsItem(let newsItem):
            coordinator?.handle(event: .detailNews(newsItem))
        case .refetchNews:
            coordinator?.handle(event: .fetch)
        }
    }
    
}


//MARK: Event
extension NewsSceneViewModel {
    enum NewsListSceenViewModelEvent {
        case detailNews(NewsItem)
        case fetch
    }
}

//MARK: Action
extension NewsSceneViewModel {
    enum NewsListSceenViewModelAction {
        case didTapNewsItem(NewsItem)
        case refetchNews
    }
}

@MainActor
extension NewsSceneViewModel {
    
    func fetchNews() {
        Task {
            do {
                let newsData: NewsData = try await apiManager.request(
                    NewsDataRouter.search
                )
                let newsItems = newsData.Data.map { query in
                    NewsItem(
                        title: query.title,
                        description: query.body,
                        imageUrl: query.imageurl
                    )
                }
                self.newsItems = newsItems
            } catch {
                print(error)
            }
        }
    }
}
