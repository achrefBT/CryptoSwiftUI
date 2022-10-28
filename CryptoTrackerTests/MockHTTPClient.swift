//
//  MockHTTPClient.swift
//  CryptoTrackerTests
//
//  Created by Achref Ben Tekaya on 28/10/2022.
//

import Foundation
@testable import Crypto_Tracker

final class MockHTTPClient: HTTPClientProtocol, Mockable {
    func fetch<T: Codable>(url: URL) async throws -> [T] {
        return loadJSON(filename: "CoinDetailResponse", type: T.self)
    }
    
    func sendData<T>(to url: URL, object: T, httpMethod: String) async throws where T : Decodable, T : Encodable {
        
    }
    
    func delete(at id: UUID, url: URL) async throws {
        
    }
}
