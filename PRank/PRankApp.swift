//
//  PRankApp.swift
//  PRank
//
//  Created by seb's on 11/12/24.
//

import SwiftUI

@main
struct PRankApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
