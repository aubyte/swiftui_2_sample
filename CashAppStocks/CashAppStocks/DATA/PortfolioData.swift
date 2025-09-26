//
//  PortfolioData.swift
//  CashAppStocks
//
//  Created by Alexey L on 9/12/25.
//

import SwiftUI


struct StockData: Codable {
    let ticker: String
    let name: String
    let currency: String
    let current_price_cents: Int
    let quantity: Int?
    let current_price_timestamp: Int
} // STOCK DATA


struct PortfolioData: Codable {
    let stocks: [StockData]
} // PORTFOLIO DATA



