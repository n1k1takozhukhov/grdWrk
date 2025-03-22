//
//  StockPreviewEventHandling.swift
//  CrowTrader
//
//  Created by Никита Кожухов on 23.03.2025.
//

import Foundation

protocol StockPreviewEventHandling: AnyObject {
    func handle(event: StockPreview.Event)
}
