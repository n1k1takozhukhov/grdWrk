//
//  NewsListViewEventHandling.swift
//  CrowTrader
//
//  Created by Никита Кожухов on 22.03.2025.
//

import Foundation

protocol NewsListViewEventHandling: AnyObject {
    func handle(event: NewsDetailView.Event)
}
