
//
//  CurrencyListCoordinator.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/28/21.
//

import Foundation

import SwiftUI

class CurrencyListCoordinator: ObservableObject, Identifiable {

    // MARK: Stored Properties
    @Published var viewModel: CurrencyListViewModel!
    @Published var detailViewModel: CurrencyDetailsViewModel?
    
    let title: String

    // MARK: Initialization

    init(title: String) {
        self.title = title

        self.viewModel = .init(
            title: title,
            coordinator: self
        )
    }

    // MARK: Methods

    func openDetails(_ currencyCode: String) {
        self.detailViewModel = .init(currencyCode: currencyCode, coordinator: self)
    }
    


}
