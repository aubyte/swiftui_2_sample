//
//  ContentView.swift
//  CashAppStocks
//
//  Created by Alexey L on 9/12/25.
//

import SwiftUI

@MainActor
struct ContentView: View {
    @StateObject var configModel = ConfigModel.shared
    @StateObject var portfolioModel = PortfolioModel.shared
    
    
    @State var isBusy = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack(alignment: .leading) {
            ConfigView()
                .padding(.vertical)
            
            let text = isBusy ? "⌛️" : "Fetch Portfolio"
            Button(text) {
                portfolioModel.cancelAndRefreshData()
            }
            .font(.system(size: 20))
            
            let errorText = portfolioModel.status.description()
            let isError = !errorText.isEmpty
            if isError {
                Text(errorText)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
            } // IF

            PortfolioView()
                .padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        
        .onChange(of: configModel.isAutorefresh) { _, newValue in
            if newValue {
                portfolioModel.recurringRefreshData()
            }
        }
        
        .onChange(of: portfolioModel.status) { _, newValue in
            let isBusy = newValue == FetchStatus.inProgress
            // Usability delay.
            let delay = isBusy ? 0.0 : 0.2
            withAnimation(.easeInOut(duration: 0.2).delay(delay)) {
                self.isBusy = isBusy
            }
        }
    } // BODY
} // CONTENT VIEW

