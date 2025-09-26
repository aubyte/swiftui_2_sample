//
//  TestAPI.swift
//  CashAppStocks
//
//  Created by Alexey L on 9/13/25.
//

import SwiftUI


// Provides test data for the test cases.
// And for offline UI tests.
@MainActor
class TestAPI: API {
    static let TEST_DATA = PortfolioData(stocks: [
        StockData(ticker: "A", name: "1st", currency: "USD", current_price_cents: 100, quantity: nil, current_price_timestamp: 0),
        StockData(ticker: "B", name: "2nd", currency: "USD", current_price_cents: 200, quantity: 10, current_price_timestamp: 0),
        StockData(ticker: "C", name: "3rd", currency: "USD", current_price_cents: 300, quantity: nil, current_price_timestamp: 0),
    ])
    static let EMPTY_TEST_DATA = PortfolioData(stocks: [])
    
    
    // MARK: - FUNCS
    
    func fetchData() async -> (PortfolioData?, FetchStatus) {
        switch ConfigModel.shared.portfolioEndpoint {
        case .normal:
            return (Self.TEST_DATA, .success)
        case .malformed:
            return (nil, .resultMalformed(error: "malformed"))
        case .empty:
            return (Self.EMPTY_TEST_DATA, .success)
        }
    } // FUNC FETCH DATA
    
} // TEST API

