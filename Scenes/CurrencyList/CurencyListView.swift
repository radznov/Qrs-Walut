//
//  CurencyListView.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/29/21.
//

import SwiftUI

struct CurrencyList: View {

    // MARK: Stored Properties

    @ObservedObject var viewModel: CurrencyListViewModel
    
    @State private var currencyID: Int = 0
    
    // MARK: Views
    var body: some View {

        VStack{
            
            HStack {
                
                Text(viewModel.currencyListResults.base)
                    .font(.title)
                    .padding()
                Spacer()
                Menu {
                    Picker(selection: $currencyID, label: Text("")) {
                        ForEach(viewModel.currencyListResults.currencyCodes.indices, id: \.self) { idx in
                            Text(viewModel.currencyListResults.currencyCodes[idx]).tag(idx)
                        }
                    }
                    .onChange(of: currencyID) {
                        viewModel.loadAnyCurrencyRates(viewModel.currencyListResults.currencyCodes[$0])
                    }
                }
                
                
                label: {
                    Label("", systemImage: "dollarsign.circle.fill")
                        .scaleEffect(CGSize(width: 2, height: 2))
                        .padding()
                        
                }
            }
            
            List{
                
                    ForEach(viewModel.currencyListResults.ratesCleaned.sorted(by: >), id: \.key) { key, value in
                        CurrencyListRow(currencyDetail: (key, value.round(to: 3)))
                            .onNavigation { viewModel.openDetails(currencyFrom: viewModel.currencyListResults.base, currencyTo: key) }
                    }
                
                }

        }
        .navigationBarTitle(viewModel.title, displayMode: .inline)
        
    }
    


}
