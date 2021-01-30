//
//  CurrencyDetailsView.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/29/21.
//

import SwiftUI

struct CurrencyDetailsView: View {

    // MARK: Stored Properties
    @ObservedObject var viewModel: CurrencyDetailsViewModel
    @State var chartOn = false
    
    // MARK: Views
    var body: some View {

        VStack {

            List{
                LineChart(dataPoints: viewModel.currencyRatesTime.chartDataNormalizedValuesReversed.map { CGFloat($0) })
                    .trim(to: chartOn ? 1 : 0)
                    .stroke(Color.red, lineWidth: self.chartLineWidth)
                    .aspectRatio(self.chartAspectRatio, contentMode: .fit)
                    .animation(.easeInOut(duration: self.chartAnimationDuration), value: chartOn)
                    .onAppear {
                        chartOn = true
                    }

                ForEach(viewModel.currencyRatesTime.ratesSorted, id: \.self.key) { tuple in
                    CurrencyDetailRow(currencyDetail: (tuple.key, tuple.value[viewModel.currencyCodeTo]!.round(to: self.currencyRound)))
                    }
                    
                }
            .navigationTitle(Text(String(viewModel.currencyCodeFrom + " to " + viewModel.currencyCodeTo)))
        }
        
    }
    
    // MARK: View Properties
    
    let currencyRound: Int = 5
    
    let chartLineWidth: CGFloat = 2
    let chartAspectRatio: CGFloat = 16/10
    
    let chartAnimationDuration: Double = 1.5

}
