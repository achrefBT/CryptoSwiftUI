//
//  NetworkingManagement.swift
//  CryptoSwiftUI
//
//  Created by Achref Ben Tekaya on 8/9/2022.
//

import Foundation
import Combine

class NetworkingManagement {

    enum NetworkingError: LocalizedError {
        case badURLResponse
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse: return "Bad response from URL"
            case .unknown: return "Unknown error occured"
            }
        }
    }
    
    static func downloadUrl(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { try handleURLResponse(output: $0) }
            .retry(3)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse (output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse
        }
        return output.data
    }
    
    static func handleCompletion (completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let err):
            print(err.localizedDescription)
        }
    }
}
