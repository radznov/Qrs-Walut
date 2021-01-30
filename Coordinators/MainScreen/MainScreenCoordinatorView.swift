//
//  MainScreenCoordinatorView.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/28/21.
//

import SwiftUI

struct MainScreenCoordinatorView: View {

    // MARK: Stored Properties

    @ObservedObject var coordinator: MainScreenCoordinator

    // MARK: Views

    var body: some View {
        TabView(selection: $coordinator.tab) {
            
            CurrencyListCoordinatorView(coordinator: coordinator.currencyListCoordinator)
                .tabItem { Label(coordinator.currencyListCoordinator.title,
                                 systemImage: "dollarsign.circle") }
                .tag(MainScreenTab.currencies)

            NavigationView {
                SettingsView(coordinator: coordinator)
            }
            .tabItem { Label("Settings", systemImage: "gear") }
            .tag(MainScreenTab.settings)

        }
        

    }

}
