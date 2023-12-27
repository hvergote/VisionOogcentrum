//
//  AfspraakRepository.swift
//  VisionOogcentrum
//
//  Created by Arnaud De Weghe on 27/12/2023.
//

import Foundation

protocol AfspraakRepository {
    func postGebruiker(gebruiker: Gebruiker) async throws -> GebruikerResponse
}

class NetworkAfspraakRepository: AfspraakRepository {
    func postGebruiker(gebruiker: Gebruiker) async throws -> GebruikerResponse {
        return try await ApiService.shared.postGebruiker(gebruiker: gebruiker)
    }
}
