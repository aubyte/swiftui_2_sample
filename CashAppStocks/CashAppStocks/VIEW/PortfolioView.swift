//
//  PortfolioView.swift
//  CashAppStocks
//
//  Created by Alexey L on 9/13/25.
//

import SwiftUI


// A list of stock tickers.
struct PortfolioView: View {
    @ObservedObject var portfolioModel = PortfolioModel.shared
    
    
    // MARK: - BODY
    
    var body: some View {
        if let portfolioData = portfolioModel.portfolioData,
           !portfolioData.stocks.isEmpty {
            List {
                ForEach(portfolioData.stocks, id: \.ticker) { stock in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(stock.ticker)
                                .font(.system(size: 20, weight: .bold))
                            Text(stock.name)
                        } // VSTACK
                        .lineLimit(1)
                        .truncationMode(.tail)
                        
                        Spacer()
                        
                        let time = Date(timeIntervalSince1970: TimeInterval(stock.current_price_timestamp))
                        let priceCents = stock.current_price_cents
                        let price = "\(priceCents / 100).\(priceCents % 100)"
                        VStack(alignment: .trailing) {
                            Text(time.formatted(date: .numeric, time: .standard))
                            Text(price)
                                .fontWeight(.bold)
                                .foregroundStyle(.green)
                            Text(stock.currency)
                        } // VSTACK
                        .lineLimit(1)
                        .truncationMode(.head)
                        
                        ZStack {
                            if let quantity = stock.quantity {
                                Text("X \(quantity)")
                                    .font(.system(size: 20, weight: .thin))
                            } // IF
                        } // ZSTACK
                        .frame(width: 50, alignment: .leading)
                    } // HSTACK
                }
            } // LIST
        } else {
            Text("EMPTY")
                .frame(maxWidth: .infinity, alignment: .top)
                .font(.system(size: 50))
                .foregroundStyle(.gray.opacity(0.5))
        } // IF ELSE
    } // BODY
} // PORTFOLIO VIEW

