//
//  CurrencyListCoordinatorView.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/28/21.
//

import SwiftUI

struct CurrencyListCoordinatorView: View {

    // MARK: Stored Properties

    @ObservedObject var coordinator: CurrencyListCoordinator

    // MARK: Views

    var body: some View {
        NavigationView {
            CurrencyList(viewModel: coordinator.viewModel)
                .navigation(item: $coordinator.detailViewModel) { viewModel in
                        currencyDetailsView(viewModel)
                }
            
        }
    }

    @ViewBuilder
    private func currencyDetailsView(_ viewModel: CurrencyDetailsViewModel) -> some View {
        CurrencyDetailsView(
            viewModel: viewModel
        )
    }
    
   

}
