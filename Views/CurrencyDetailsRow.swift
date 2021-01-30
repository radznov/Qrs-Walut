//
//  CurrencyDetailsRow.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/29/21.
//

import Foundation

import SwiftUI

struct CurrencyDetailRow: View {
    
    var currencyDetail: (String, Double)
    
    var body: some View {
            HStack {

                Text(self.currencyDetail.0)
                    .font(.title3)
                Text(Date.dayOfWeek(Date.convertStringToDate(self.currencyDetail.0)!)!)
                    .font(.title3)
                    .foregroundColor(.gray)
                Spacer()
                Text(String(self.currencyDetail.1))
                    .font(.title3)
                
            }
        }
}
