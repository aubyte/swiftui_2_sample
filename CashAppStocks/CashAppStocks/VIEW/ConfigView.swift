//
//  ConfigView.swift
//  CashAppStocks
//
//  Created by Alexey L on 9/12/25.
//

import SwiftUI


// A panel visualizing configuration options (see ConfigModel).
struct ConfigView: View {
    @ObservedObject var configModel = ConfigModel.shared
    
    @State var isExpanded = false
    
    
    // MARK: - BODY
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // 1. HEADER
            
            // Not really needed. It is here, because was expecting dynamic production data.
            Toggle("Configuration", isOn: $isExpanded)
                .toggleStyle(ConfigToggleStyle())
                .font(.system(size: 20))

            // 2. DETAILS
            
            if isExpanded {
                VStack(alignment: .leading, spacing: 10) {
                    Toggle("Autorefresh (every 2 seconds)", isOn: $configModel.isAutorefresh)
                    HStack {
                        Text("Endpoint: ")
                        Picker("", selection: $configModel.portfolioEndpoint) {
                            ForEach(PortfolioEndpoint.allCases, id: \.self) { endpoint in
                                Text(endpoint.description())
                            }
                        } // PiCKER
                        .pickerStyle(.segmented)
                    } // HSTACK

                } // VSTACK
                .transition(.move(edge: .top))
                .padding()
            } // IF
            
        } // VSTACK
        .clipped()
    } // BODY
} // CONFIG VIEW

