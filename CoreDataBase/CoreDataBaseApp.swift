//
//  CoreDataBaseApp.swift
//  CoreDataBase
//
//  Created by dorellana on 26/04/22.
//

import SwiftUI

@main
struct CoreDataBaseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
