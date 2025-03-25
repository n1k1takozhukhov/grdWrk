//
//  File.swift
//  CrowTrader
//
//  Created by Никита Кожухов on 25.03.2025.
//

import Foundation
protocol SnapsListViewEventHandling: AnyObject {
    func handle(event: SnapsViewModel.SnapsEvent)
}
