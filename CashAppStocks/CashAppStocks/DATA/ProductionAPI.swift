//
//  ProductionAPI.swift
//  CashAppStocks
//
//  Created by Alexey L on 9/12/25.
//

import SwiftUI


// Can be production or test.
protocol API {
    func fetchData() async -> (PortfolioData?, FetchStatus)
} // API


// Helper functions to work with production API (fetch from endpoints).
@MainActor
class ProductionAPI: API {
    
    // Fetches data from the currently configured endpoint (see ConfigModel).
    func fetchData() async -> (PortfolioData?, FetchStatus) {
        
        // 1. Get data
        
        var jsonData: Data?
        
        do {
            // Clears cache? (not sure).
            URLSession.shared.finishTasksAndInvalidate()
            // Current endpoint.
            let url = ConfigModel.shared.portfolioEndpoint.url()
            (jsonData, _) = try await URLSession.shared.data(from: url)
        } catch {
            return (nil, .sessionError(error: error.localizedDescription))
        }
        
        guard let data = jsonData else {
            return (nil, .resultNoData)
        }
        
        // 2. Parse JSON
        
        do {
            let jsonTask = Task {
                try JSONDecoder().decode(PortfolioData.self, from: data)
            }
            let portfolioData = try await jsonTask.value
            return (portfolioData, .success)
        } catch {
            return (nil, .resultMalformed(error: error.localizedDescription))
        }
    } // FUNC FETCH DATA
} // PRODUCTION API

