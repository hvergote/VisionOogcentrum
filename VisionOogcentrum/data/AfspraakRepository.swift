//
//  AfspraakRepository.swift
//  VisionOogcentrum
//
//  Created by Arnaud De Weghe on 27/12/2023.
//

import Foundation

protocol AfspraakRepository {
    func postGebruiker(gebruikerPush: GebruikerPush) async throws -> GebruikerResponse
    func postPatiënt(patiënt: Patiënt) async throws -> PatiëntResponse
    func getAfsprakenByArtsId(id: String) async throws -> [Afspraak]
}

class NetworkAfspraakRepository: AfspraakRepository {
    func postGebruiker(gebruikerPush: GebruikerPush) async throws -> GebruikerResponse {
        return try await ApiService.shared.postGebruiker(gebruikerPush: gebruikerPush)
    }
    func postPatiënt(patiënt: Patiënt) async throws -> PatiëntResponse {
        return try await ApiService.shared.postPatiënt(patiënt: patiënt)
    }
    func getAfsprakenByArtsId(id: String) async throws -> [Afspraak] {
        return try await ApiService.shared.getAfsprakenByArtsId(id: id)
    }
}
