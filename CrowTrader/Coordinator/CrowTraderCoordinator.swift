import Foundation
import SwiftUI

@MainActor
final class CrowTraderCoordinator{
    
    
    let container: DIContainer
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController
    
    private lazy var mainScreenViewModel = MainScreenViewModel(
        apiManager: container.apiManager,
        coordinator: self
    )
    
    private lazy var newsListSceenViewModel = NewsSceneViewModel(
        coordinator: self,
        apiManager: container.apiManager
    )
    
    private lazy var stockPreviewViewModel = StockPreviewViewModel(
        apiManager: container.apiManager
    )
    
    private lazy var snapsViewModel = SnapsViewModel(
        apiManager: container.apiManager,
        snapsService: container.snapsService
    )

    
    init(navigationController: UINavigationController, container: DIContainer) {
        self.container = container
        self.navigationController = navigationController
        
        start()
    }
}

extension CrowTraderCoordinator: Coordinator {
    func start() {
        print("Starting CrowTraderCoordinator")
        let signInViewController = makeTabView()
        navigationController.setViewControllers([signInViewController], animated: true)
    }
}


//MARK: Factories
private extension CrowTraderCoordinator {
    func makeTabView() -> UIViewController {
        let view = TabController(
            viewModel: self.mainScreenViewModel,
            newsListScreenViewModel: self.newsListSceenViewModel,
            snapsViewModel: self.snapsViewModel
        )
        return UIHostingController(rootView: view)
    }
}

private extension CrowTraderCoordinator {
    func makeStockDetailView(stockItem: StockItem) -> UIViewController {
        let view = StockPreview(
            viewModel: self.stockPreviewViewModel,
            coordinator: self
        )
        return UIHostingController(rootView: view)
    }
}


private extension CrowTraderCoordinator {
    func makeNewsDetailView(newsItem: NewsItem) -> UIViewController {
        let view = NewsDetailView(
            coordinator: self
            , newsItem: newsItem
        )
        return UIHostingController(rootView: view)
    }
}

private extension CrowTraderCoordinator {
    func makeNewsListView() -> UIViewController {
        let view = NewsListView(
            viewModel: self.newsListSceenViewModel,
            coordinator: self
        )
        return UIHostingController(rootView: view)
    }
}


//MARK: Navigating
extension CrowTraderCoordinator: StockPreviewEventHandling {
    func handle(event: StockPreview.Event) {
        switch event {
        case .close:
            navigationController.topViewController?.dismiss(animated: true)
        }
    }
}

extension CrowTraderCoordinator: TabControllerEventHandling {
    func handle(event: TabController.Event) {
        switch event {
        case .close:
            navigationController.topViewController?.dismiss(animated: true)
        }
    }
}
extension CrowTraderCoordinator: MainViewEventHandling {
    func handle(event: MainScreenViewModel.Event) {
        switch event {
        case let .detailStockPreview(stockItem):
            let viewController = makeStockDetailView(stockItem: stockItem)
            navigationController.present(viewController, animated: true)
        }
    }
}

extension CrowTraderCoordinator: NewsDetailViewEventHandling {
    func handle(event: NewsDetailView.Event) {
        switch event {
        case .close:
            navigationController.topViewController?.dismiss(animated: true)
        }
    }
}

extension CrowTraderCoordinator: NewsListViewEventHandling {
    func handle(event: NewsSceneViewModel.NewsListSceenViewModelEvent) {
        switch event {
        case let .detailNews(newsItem):
            let viewController = makeNewsDetailView(newsItem: newsItem)
            navigationController.present(viewController, animated: true)
        case .fetch:
            newsListSceenViewModel.fetchNews()
        }
    }
    
    func handle(event: NewsListView.Event) {
        switch event {
        case .close:
            navigationController.topViewController?.dismiss(animated: true)
        }
    }
}
