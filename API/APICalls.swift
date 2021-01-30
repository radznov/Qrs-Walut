//
//  APICalls.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/29/21.
//

import Foundation

enum NetworkError: Error {
    case url
    case server
}

class APICalls {
    
    let decoder = JSONDecoder()
    
    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    // MARK: API calls
    
    func getPolishToOtherCurrencyRateTime(_ currencyCode: String) -> CurrencyRateTime? {
        
        let path: String = "https://api.exchangeratesapi.io/history?start_at=\(Date.lastWeekMondayDate)&end_at=\(Date.currentDate)&base=PLN&symbols=\(currencyCode)"
        
        return getCurrencRateTime(path)
    }
    
    func getAnyToOtherCurrencyRateTime(_ currencyCodeFrom: String, _ currencyCodeTo: String) -> CurrencyRateTime? {
        
        let path: String = "https://api.exchangeratesapi.io/history?start_at=\(Date.lastWeekMondayDate)&end_at=\(Date.currentDate)&base=\(currencyCodeFrom)&symbols=\(currencyCodeTo)"

        return getCurrencRateTime(path)
    }
    
    func getAnyRecentCurrencyRates(_ currencyCode: String) -> CurrencyRates? {

        let path: String = "https://api.exchangeratesapi.io/latest?base=\(currencyCode)"
        
        return getCurrencyRates(path)
    }
    
    func getPolishRecentCurrencyRates() -> CurrencyRates? {

        let path: String = "https://api.exchangeratesapi.io/latest?base=PLN"
        
        return getCurrencyRates(path)
    }
    
    func getRecentCurrencyRates() -> CurrencyRates? {
        
        let path: String = "https://api.exchangeratesapi.io/latest"
        
        return getCurrencyRates(path)
        
    }
    
    // MARK: private functions
    
    private func getCurrencRateTime(_ path: String) -> CurrencyRateTime? {
       
        var result: CurrencyRateTime?
        
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
    
    private func getCurrencyRates(_ path: String) -> CurrencyRates? {
        
        var result: CurrencyRates?
        
        switch self.makeAPICall(path) {
            case let .success(data):
                    if let decodedResponse = try? JSONDecoder().decode(CurrencyRates.self, from: data!) {
                        result = decodedResponse
                    }
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
