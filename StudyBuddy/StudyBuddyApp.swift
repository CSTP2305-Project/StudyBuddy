//
//  StudyBuddyApp.swift
//  StudyBuddy
//
//  Created by valentina on 2023-03-29.
//

import SwiftUI

@main
struct StudyBuddyApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
