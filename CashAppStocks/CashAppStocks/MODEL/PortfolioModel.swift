//
//  PortfolioModel.swift
//  CashAppStocks
//
//  Created by Alexey L on 9/12/25.
//

import SwiftUI


// Bridges portfolio data to views.
@MainActor
class PortfolioModel: ObservableObject {
    // Uses production API and is available to all views.
    static let shared = PortfolioModel(api: ProductionAPI())
    
    let api: API
    
    // The most recent fetch results and status.
    @Published var portfolioData: PortfolioData?
    @Published var status = FetchStatus.success
    
    var refreshTask: Task<Void, Never>?
    
    
    // MARK: - INIT
    
    // Use concrete API to init a model.
    init(api: API) {
        self.api = api
    }
    
    
    // MARK: - FUNCS
    
    func refreshData() async {
        (portfolioData, status) = await api.fetchData()
    } // FUNC REFRESH DATA

    
    // Helper to spawn async refresh task.
    func cancelAndRefreshData() {
        status = .inProgress
        refreshTask?.cancel()
        refreshTask = Task { await refreshData() }
    } // FUNC REFRESH DATA
    
    
    // Helper to spawn recurring (every 2 seconds) async refresh task.
    func recurringRefreshData() {
        guard ConfigModel.shared.isAutorefresh else { return }
        self.cancelAndRefreshData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.recurringRefreshData()
        }
    } // FUNC RECURRING REFRESH DATA
} // PORTFOLIO MODEL


