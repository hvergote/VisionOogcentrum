//
//  AfspraakRepository.swift
//  VisionOogcentrum
//
//  Created by Arnaud De Weghe on 27/12/2023.
//

import Foundation

protocol AfspraakRepository {
    func postGebruiker(gebruiker: Gebruiker) async throws -> GebruikerResponse
    func postPatiënt(patiënt: Patiënt) async throws -> PatiëntResponse
}

class NetworkAfspraakRepository: AfspraakRepository {
    func postGebruiker(gebruiker: Gebruiker) async throws -> GebruikerResponse {
        return try await ApiService.shared.postGebruiker(gebruiker: gebruiker)
    }
    func postPatiënt(patiënt: Patiënt) async throws -> PatiëntResponse {
        return try await ApiService.shared.postPatiënt(patiënt: patiënt)
    }
}
