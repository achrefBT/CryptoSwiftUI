//
//  CoinDetailViewModelTest.swift
//  CryptoTrackerTests
//
//  Created by Achref Ben Tekaya on 28/10/2022.
//

import Combine
import XCTest
@testable import Crypto_Tracker

class CoinDetailViewModelTests: XCTestCase {
    
    var coinDetailVM: DetailViewModel!
    
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        coinDetailVM = DetailViewModel(httpClient: MockHTTPClient())
        cancellables = []
    }
    
    override func tearDown() {
        super.tearDown()
        coinDetailVM = nil
        cancellables = []
    }
    
    func testFetchSongSuccessfully() async throws {
        
        let expectation = XCTestExpectation(description: "Fetched Songs")
        
        try await coinDetailVM.fetchCoinDetail()
        
        coinDetailVM
            .$coin
            .sink { value in
                XCTAssertEqual(value.symbol, "Btc")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1)
        
    }

}
