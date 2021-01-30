//
//  CurrencyListViewModel.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/30/21.
//

import SwiftUI

extension Identifiable where ID: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

class CurrencyListViewModel: ObservableObject {

    
    // MARK: Stored Properties

    @Published var title: String

    var isLoading = true
    @Published var currencyListResults = CurrencyRates(rates: [:], base: "", date: "")
    
    private unowned let coordinator: CurrencyListCoordinator
    
    private var api: APICalls

    // MARK: Initialization

    init(title: String,
         coordinator: CurrencyListCoordinator)
    {
        self.api = APICalls()
        self.title = title
        self.coordinator = coordinator
    
        
        self.loadPolishCurrencyRates()
    }

    // MARK: Methods
    
    func openDetails(currencyFrom: String, currencyTo: String) {
        self.coordinator.openDetails(from: currencyFrom, to: currencyTo)
    }
    
    func loadPolishCurrencyRates() {
        self.currencyListResults = api.getPolishRecentCurrencyRates()!
    }
    
    func loadAnyCurrencyRates(_ currencyCode: String) {
        self.currencyListResults = api.getAnyRecentCurrencyRates(currencyCode)!
    }

}
