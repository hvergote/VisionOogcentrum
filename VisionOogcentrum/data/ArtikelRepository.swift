//
//  ArtikelRepository.swift
//  VisionOogcentrum
//
//  Created by Arnaud De Weghe on 21/11/2023.
//

import Foundation

protocol ArtikelRepository {
    func getAllArtikels()async throws -> [Artikel]
}

class NetworkArtikelRepository: ArtikelRepository {
    func getAllArtikels() async throws -> [Artikel] {
        return try await ArtikelService.shared.getArtikels()
    }
}
