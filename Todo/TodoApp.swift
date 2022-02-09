//
//  TodoApp.swift
//  Todo
//
//  Created by Killian on 09/02/2022.
//

import SwiftUI
import Firebase

@main
struct TodoApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
