//
//  APICalls.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/29/21.
//

import Foundation
import Combine

enum NetworkError: Error {
    case url
    case server
}

class APICalls {
    
//     var isLoading = true
//     var currencyListResults = CurrencyRates(rates: [:], base: "", date: "")

    let decoder = JSONDecoder()
    
    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func getPolishToOtherCurrencyRateTime(_ currencyCode: String) -> CurrencyRateTime? {
        
        var result: CurrencyRateTime?
        
        let path: String = "https://api.exchangeratesapi.io/history?start_at=\(Date.lastWeekMondayDate)&end_at=\(Date.currentDate)&base=PLN&symbols=\(currencyCode)"
        
        switch self.makeAPICall(path) {
            case let .success(data):
                if let decodedResponse = try? self.decoder.decode(CurrencyRateTime.self, from: data!) {
                        result = decodedResponse
                    }
                print(data!)
            case let .failure(error):
                print(error)
        }
        return result
        
    }
    
    func getAnyToOtherCurrencyRateTime(_ currencyCodeFrom: String, _ currencyCodeTo: String) -> CurrencyRateTime? {
        
        var result: CurrencyRateTime?
        
        let path: String = "https://api.exchangeratesapi.io/history?start_at=\(Date.lastWeekMondayDate)&end_at=\(Date.currentDate)&base=\(currencyCodeFrom)&symbols=\(currencyCodeTo)"

        switch self.makeAPICall(path) {
            case let .success(data):
                if let decodedResponse = try? self.decoder.decode(CurrencyRateTime.self, from: data!) {
                        result = decodedResponse
                    }
            case let .failure(error):
                print(error)
        }
        return result
        
    }
    
    func getAnyRecentCurrencyRates(_ currencyCode: String) -> CurrencyRates? {
        
        var result: CurrencyRates?
        
        let path: String = "https://api.exchangeratesapi.io/latest?base=\(currencyCode)"
        
        switch self.makeAPICall(path) {
            case let .success(data):
                if let decodedResponse = try? self.decoder.decode(CurrencyRates.self, from: data!) {
                        result = decodedResponse
                    }
                print(data!)
            case let .failure(error):
                print(error)
        }
        return result
    }
    
    func getPolishRecentCurrencyRates() -> CurrencyRates? {
        
        var result: CurrencyRates?
        
        let path: String = "https://api.exchangeratesapi.io/latest?base=PLN"
        
        switch self.makeAPICall(path) {
            case let .success(data):
                if let decodedResponse = try? self.decoder.decode(CurrencyRates.self, from: data!) {
                        result = decodedResponse
                    }
                print(data!)
            case let .failure(error):
                print(error)
        }
        return result
    }
    
    func getRecentCurrencyRates() -> CurrencyRates? {
        
        var result: CurrencyRates?
        
        let path: String = "https://api.exchangeratesapi.io/latest"
        
        switch self.makeAPICall(path) {
            case let .success(data):
                    if let decodedResponse = try? JSONDecoder().decode(CurrencyRates.self, from: data!) {
                        result = decodedResponse
                    }
                print(data!)
            case let .failure(error):
                print(error)
        }
        return result
    }
    
    
    private func makeAPICall(_ path: String) -> Result<Data?, NetworkError> {
        guard let url = URL(string: path) else {
            return .failure(.url)
        }
        var result: Result<Data?, NetworkError>!
        
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                result = .success(data)
            } else {
                result = .failure(.server)
            }
            semaphore.signal()
        }.resume()
        _ = semaphore.wait(wallTimeout: .distantFuture)
        return result
    }

    
}
