//
//  NewsData.swift
//  CrowTrader
//
//  Created by Никита Кожухов on 24.03.2025.
//

import Foundation

// MARK: News data models
struct NewsData: Codable {
    let Data: [NewsItemQuery]
}

struct NewsItemQuery: Codable {
    let imageurl: String
    let url: String
    let title: String
    let body: String
}
