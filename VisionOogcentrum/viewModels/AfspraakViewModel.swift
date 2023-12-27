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
    

    init() {
        self.afspraakRepository = NetworkAfspraakRepository()
    }
    
    func postGebruiker(naam: String, voornaam: String) async throws -> GebruikerResponse {
        let gebruiker = Gebruiker(naam: naam, voornaam: voornaam)
        do {
            let response = try await afspraakRepository.postGebruiker(gebruiker: gebruiker)
            return response
        } catch {
            print("Error: \(error)")
            throw error
        }
    }


}
