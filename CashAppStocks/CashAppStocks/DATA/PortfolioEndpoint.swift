//
//  PortfolioEndpoint.swift
//  CashAppStocks
//
//  Created by Alexey L on 9/13/25.
//

import SwiftUI


// Endpoints.
enum PortfolioEndpoint: Int, CaseIterable {
    static let BASE_API_URL = "https://storage.googleapis.com/cash-homework/cash-stocks-api"
    static let URLS = [
        URL(string: BASE_API_URL + "/portfolio.json")!,
        URL(string: BASE_API_URL + "/portfolio_malformed.json")!,
        URL(string: BASE_API_URL + "/portfolio_empty.json")!,
    ]
    static let DESCRIPTION = ["Normal", "Malformed", "Empty"]

    
    case normal, malformed, empty

    
    // MARK: - FUNCS
    
    func url() -> URL {
        Self.URLS[self.rawValue]
    } // FUNC URL
    
    func description() -> String {
        Self.DESCRIPTION[self.rawValue]
    } // FUNC DESCRIPTION
} // PORTFOLIO ENDPOINT
