//
//  FetchStatus.swift
//  CashAppStocks
//
//  Created by Alexey L on 9/13/25.
//

import SwiftUI


// Status codes, and their text messages.
enum FetchStatus: Equatable {
    case inProgress, success, sessionError(error: String), resultNoData, resultMalformed(error: String)
    
    // MARK: - FUNCS
    
    func description() -> String {
        switch self {
        case let .sessionError(error), let .resultMalformed(error):
            return error
        case .resultNoData:
            return "No data found."
        default:
            return ""
        }
    } // FUNC DESCRIPTION
} // FETCH STATUS

