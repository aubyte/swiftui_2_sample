//
//  CashAppStocksTests.swift
//  CashAppStocksTests
//
//  Created by Alexey L on 9/12/25.
//

import XCTest


final class CashAppStocksTests: XCTestCase {

    var testModel: PortfolioModel!

    
    override func setUpWithError() throws {
        Task { @MainActor in
            testModel = PortfolioModel(api: TestAPI())
        }
    }

    override func tearDownWithError() throws {
        Task { @MainActor in
            testModel = nil
        }
    }

    // Normal endpoint
    func testNormalEndpoint() throws {
        Task { @MainActor in
            ConfigModel.shared.portfolioEndpoint = .normal
            await testModel.refreshData()
            XCTAssert(testModel.status == .success)
            XCTAssert(testModel.portfolioData?.stocks.count == TestAPI.TEST_DATA.stocks.count)
        }
    }
        
    // Malformed endpoint
    func testMalformedEndpoint() throws {
        Task { @MainActor in
            ConfigModel.shared.portfolioEndpoint = .malformed
            await testModel.refreshData()
            if case .resultMalformed(error: _) = testModel.status {
                XCTAssert(testModel.portfolioData == nil)
                return
            }
            // Wrong status.
            XCTAssert(false)
        }
    }
    
    
    // Empty endpoint
    func testEmptyEndpoint() throws {
        Task { @MainActor in
            ConfigModel.shared.portfolioEndpoint = .empty
            await testModel.refreshData()
            XCTAssert(testModel.status == .success)
            XCTAssert(testModel.portfolioData?.stocks.count == 0)
        }
    }

} // TESTS
