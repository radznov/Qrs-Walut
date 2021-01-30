//
//  CurrencyRates.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/29/21.
//

import Foundation


struct CurrencyRates: Codable {
    
    let rates: [String: Double]
    let base: String
    let date: String
    
    var ratesConverted:  [String: Double] {
        var newRates = [String: Double]()
        for (key, value) in rates {
            newRates[key] = value.round(to: 3)
        }
        return newRates
    }
    
    var ratesCleaned: [String: Double] {
        var ratesCopy = self.rates
        ratesCopy[base] = nil
        return ratesCopy
    }
    
    var currencyCodes: [String] {
        Array(ratesCleaned.keys.sorted {$1 > $0})
    }
}

