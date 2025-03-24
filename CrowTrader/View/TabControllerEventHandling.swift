//
//  TabControllerEventHandling.swift
//  CrowTrader
//
//  Created by Никита Кожухов on 23.03.2025.
//

import Foundation

protocol TabControllerEventHandling: AnyObject {
    func handle(event: TabController.Event)
}
