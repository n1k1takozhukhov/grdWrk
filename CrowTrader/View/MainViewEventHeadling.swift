//
//  MainViewEventHeadling.swift
//  CrowTrader
//
//  Created by Никита Кожухов on 22.03.2025.
//

import Foundation

protocol MainViewEventHeadling: AnyObject {
    func handle(event: MainScreenViewModel.Event)
}
