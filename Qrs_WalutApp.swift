//
//  Qrs_WalutApp.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/28/21.
//

import SwiftUI

@main
struct Qrs_WalutApp: App {
    
    @StateObject var coordinator = MainScreenCoordinator()
    
    // MARK: Scenes
    var body: some Scene {
        WindowGroup {
            MainScreenCoordinatorView(coordinator: coordinator)
        }
    }
}
    
    


