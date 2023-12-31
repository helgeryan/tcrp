//
//  tcrpApp.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/20/23.
//

import SwiftUI
import Firebase

@main
struct tcrpApp: App {
    @StateObject var viewModel = AuthViewModel()
    @StateObject var dbManager = DatabaseManager()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().preferredColorScheme(.light)
                .environmentObject(viewModel)
                .environmentObject(dbManager)
        }
    }
}
