//
//  StockDataRouter.swift
//  CrowTrader
//
//  Created by Никита Кожухов on 22.03.2025.
//

import Foundation

enum StockDataRouter: Endpoint {
    case search(symbol: String)
    case chart(symbol: String)
    case info(symbol: String)
    
    var host: String {
            return "https://query2.finance.yahoo.com"
        }
    
    var path: String {
        switch self {
        case .search:
            return "/v1/finance/search"
        case let .chart(symbol):
            return "/v8/finance/chart/\(symbol)"
        case .info(symbol: let symbol):
            return "/v1/finance/quoteType/\(symbol)"
        }
    }

    var urlParameters: [String: Any] {
        switch self {
        case let .search(symbol):
            return ["q": symbol]
        case .chart:
            return [:]
        case .info:
            return [:]
        }
    }
}
