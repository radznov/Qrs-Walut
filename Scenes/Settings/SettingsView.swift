//
//  SettingsView.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/30/21.
//

import SwiftUI

struct SettingsView: View {

    // MARK: Stored Properties

    @ObservedObject var coordinator: MainScreenCoordinator

    // MARK: Views

    var body: some View {
        VStack(spacing: 8) {
            Text("""
                  Sample App Description
                  Visit our website
                  """)
        }
        .multilineTextAlignment(.center)
        .onTapGesture(perform: openWebsite)
    }

    // MARK: Methods

    private func openWebsite() {
        if let url = URL(string: "https://www.salesbook-app.com") {
            UIApplication.shared.open(url)
        }
    }

}
