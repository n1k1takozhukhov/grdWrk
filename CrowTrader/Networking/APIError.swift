//
//  APIError.swift
//  CrowTrader
//
//  Created by Никита Кожухов on 22.03.2025.
//

import Foundation

enum APIError: Error {
    case urlRequestFailed
    case urlSessionFailed
    case parsingFailed
}
