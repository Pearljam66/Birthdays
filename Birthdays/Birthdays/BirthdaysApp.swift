//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Sarah Clark on 5/10/24.
//

import SwiftData
import SwiftUI

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
