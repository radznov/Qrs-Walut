//
//  CurrencyDetailsViewModel.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/30/21.
//

import Foundation

class CurrencyDetailsViewModel: ObservableObject, Identifiable {

    // MARK: Stored Properties

    private unowned let coordinator: CurrencyListCoordinator
    
    @Published var currencyRatesTime = CurrencyRateTime(rates: ["" : ["" : 0.0]], startAt: "", base: "", endAt: "")
    
    let currencyCodeFrom: String
    let currencyCodeTo: String
    private let api = APICalls()

    // MARK: Initialization

    init(currencyCodeFrom: String, currencyCodeTo: String, coordinator: CurrencyListCoordinator) {
        self.coordinator = coordinator
        self.currencyCodeFrom = currencyCodeFrom
        self.currencyCodeTo = currencyCodeTo
        
        currencyRatesTime = api.getAnyToOtherCurrencyRateTime(currencyCodeFrom, currencyCodeTo)!
    }

    // MARK: Methods

}
