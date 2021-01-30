//
//  CurrencyListRow.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/29/21.
//

import SwiftUI

struct CurrencyListRow: View {
    
    var currencyDetail: (String, Double)
    
    var body: some View {
            HStack {

                Text(self.currencyDetail.0)
                    .font(.title3)
                Spacer()
                Text(String(self.currencyDetail.1))
                    .font(.title3)
            }
        }
}
