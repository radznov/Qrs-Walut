//
//  MainScreenCoordinator.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/28/21.
//

import Foundation

enum MainScreenTab {
    case currencies
    case convert
    case settings
}


class MainScreenCoordinator: ObservableObject {

    // MARK: Stored Properties
    @Published var tab = MainScreenTab.currencies

    @Published var currencyListCoordinator: CurrencyListCoordinator!
     var apiCalls: APICalls
    

    // MARK: Initialization
    init() {
        
        self.apiCalls = APICalls()
        
        self.currencyListCoordinator = CurrencyListCoordinator(
            title: "Currencies"
        )
    }

    // MARK: Methods


}
