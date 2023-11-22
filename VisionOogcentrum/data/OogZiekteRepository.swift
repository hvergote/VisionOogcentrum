//
//  OogZiekteRepository.swift
//  VisionOogcentrum
//
//  Created by Arnaud De Weghe on 22/11/2023.
//

import Foundation

protocol OogZiekteRepository {
    func getAllOogziektes() async throws -> [OogZiekte]
}

class NetworkOogZiekteRepository: OogZiekteRepository {
    func getAllOogziektes() async throws -> [OogZiekte] {
        return try await ApiService.shared.getOogZiektes()
    }
 }
