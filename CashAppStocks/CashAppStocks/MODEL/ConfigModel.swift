//
//  ConfigModel.swift
//  CashAppStocks
//
//  Created by Alexey L on 9/12/25.
//

import SwiftUI


// Holds configuration info.
@MainActor
class ConfigModel: ObservableObject {
    static let shared = ConfigModel()
    
    @Published var isAutorefresh = false
    @Published var portfolioEndpoint = PortfolioEndpoint.normal
    
} // CONFIG MODEL

