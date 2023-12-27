//
//  AfspraakViewModel.swift
//  VisionOogcentrum
//
//  Created by Arnaud De Weghe on 27/12/2023.
//

import Foundation
import Combine
import SwiftUI

class AfspraakViewModel: ObservableObject{
    
    private let afspraakRepository: AfspraakRepository
    @Published var gebruikerResponse: GebruikerResponse?

    init() {
        self.afspraakRepository = NetworkAfspraakRepository()
    }
    
    func postGebruiker(naam: String, voornaam: String) async throws -> GebruikerResponse {
        let gebruiker = Gebruiker(naam: naam, voornaam: voornaam)
        do {
            let response = try await afspraakRepository.postGebruiker(gebruiker: gebruiker)
            gebruikerResponse = response
            return response
        } catch {
            print("Error: \(error)")
            throw error
        }
    }
    
    func postPatiënt(telefoonnummer: String, email: String, straat: String, huisnummer: Int, stad: String, postcode: Int) async throws {
        guard let gebruikerId = gebruikerResponse?.gebruikerId else {
            return
        }
        
        let patiënt = Patiënt(gebruikerId: gebruikerId, email: email, telefoonnummer: telefoonnummer, straat: straat, huisnummer: huisnummer, stad: stad, postcode: postcode)
        
        do {
            let response = try await afspraakRepository.postPatiënt(patiënt: patiënt)
        } catch {
            print("Error posting Patiënt: \(error)")
            throw error
        }
    }

}
