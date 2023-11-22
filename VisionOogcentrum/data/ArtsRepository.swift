//
//  ArtsRepository.swift
//  VisionOogcentrum
//
//  Created by Arnaud De Weghe on 22/11/2023.
//

import Foundation

protocol ArtsRepository {
    func getAllArtsen() async throws -> [Arts]
}

class NetworkArtsRepository: ArtsRepository {
    func getAllArtsen() async throws -> [Arts] {
        return try await ApiService.shared.getArtsen()
    }

}
