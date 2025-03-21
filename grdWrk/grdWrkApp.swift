//
//  grdWrkApp.swift
//  grdWrk
//
//  Created by Никита Кожухов on 21.03.2025.
//

import SwiftUI

@main
struct grdWrkApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
