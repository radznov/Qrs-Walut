//
//  CurrencyRateTime.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/29/21.
//

import Foundation

struct CurrencyRateTime: Codable {
    
    var rates: [String: [String : Double]]
    let startAt: String
    let base: String
    let endAt: String
    
    
    var ratesSorted: Array<(key: String, value: [String: Double])> {
        rates.sorted { $0.key > $1.key }
    }
    
    var chartData: Array<(String, Double)> {
        ratesSorted.map{ (k,v) in (k, Array(v.values)[0]) }
    }
    
    var chartDataNormalized: Array<(String, Double)>{
        let valuesArray = chartData.map { $0.1 }
        let minVal = valuesArray.min()
        let maxVal = valuesArray.max()
        
        return chartData.map { ($0.0, ($0.1 - minVal!) / (maxVal! - minVal!)) }
    }
    
    var chartDataNormalizedValuesReversed : [Double] {
        var array = chartDataNormalized.map { $0.1 }
        array = array.reduce([],{ [$1] + $0 })
        return array
    }
    

}

