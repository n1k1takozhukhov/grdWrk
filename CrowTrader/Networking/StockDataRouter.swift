//
//  StockDataRouter.swift
//  CrowTrader
//
//  Created by Никита Кожухов on 22.03.2025.
//

import Foundation

enum StockDataRouter: Endpoint {
    case cryptoPrice(symbol: String)
    
    var path: String {
        switch self {
        case .cryptoPrice(let symbol):
            return "/v8/finance/chart/\(symbol)"
        }
    }
    
    var urlParameters: [String : Any] {
        return [:]
    }
}
