//
//  AfspraakViewModel.swift
//  VisionOogcentrum
//
//  Created by Arnaud De Weghe on 27/12/2023.
//

import Foundation
import Combine
import SwiftUI

class AfspraakViewModel: ObservableObject {
    
    private let afspraakRepository: AfspraakRepository
    @Published var gebruikerResponse: GebruikerResponse?
    @Published var patiëntResponse: PatiëntResponse?
//    @Published var afspraakResponse: AfspraakResponse?
    @Published var afsprakenByArtsId: [Afspraak] = []
    var selectedDate = Date()
    var selectedArts: String = ""
    @Published var timeSlots: [Date] = []

    init() {
        self.afspraakRepository = NetworkAfspraakRepository()
    }
    
    func postGebruiker(naam: String, voornaam: String) async throws -> GebruikerResponse {
        let gebruiker = GebruikerPush(naam: naam, voornaam: voornaam)
        do {
            let response = try await afspraakRepository.postGebruiker(gebruikerPush: gebruiker)
            DispatchQueue.main.async {
                self.gebruikerResponse = response
            }
            return response
        } catch {
            print("🧑 Error posting Gebruiker: \(error)")
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
            print("🤒 patientId: \(response.patientId)")
            DispatchQueue.main.async {
                self.patiëntResponse = response
            }
        } catch {
            print("🤒 Error posting Patiënt: \(error)")
            throw error
        }
    }
    
    func postAfspraak(datum: Date, extraInfo: String?, artsId: String) async throws {
        let datumFormatter = DateFormatter()
        datumFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS"
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let afspraak = AfspraakPush(datum: datumFormatter.string(from: datum), extraInfo: extraInfo, startTijd: timeFormatter.string(from: Date.now), eindTijd: timeFormatter.string(from: Date.now), patientId: patiëntResponse?.patientId ?? "", artsId: selectedArts)
        do {
            try await afspraakRepository.postAfspraak(afspraak: afspraak)
//            DispatchQueue.main.async {
//                self.afspraakResponse = response
//            }
        } catch {
            print("📅 Error posting Afspraak: \(error)")
            throw error
            
        }
    }
    
    func getAfsprakenByArtsId(id: String) async {
        do {
            let response = try await afspraakRepository.getAfsprakenByArtsId(id: id)
            DispatchQueue.main.async {
                self.afsprakenByArtsId = response
            }
        } catch {
            print(error)
        }
    }
    
    func updateData(date: Date) {
        selectedDate = date
        timeSlots = loadTimeslots(date)
    }
    
    func loadTimeslots(_ date: Date) -> [Date] {
        var timeSlots: [Date] = []
        
        let calendar = Calendar.current
        var currentDate = calendar.date(bySettingHour: 8, minute: 0, second: 0, of: date) ?? Date()
        
        let endOfDay = calendar.date(bySettingHour: 18, minute: 0, second: 0, of: date) ?? Date()
        
        let afspraken = self.afsprakenByArtsId
        let datumFormatter = DateFormatter()
        datumFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let datumFormatter2 = DateFormatter()
        datumFormatter2.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS"
        
        while currentDate < endOfDay {
            let conflict = afspraken.filter { afspraak in
                var afspraakDatum = datumFormatter.date(from: afspraak.datum)
                if (afspraakDatum == nil) {
                    afspraakDatum = datumFormatter2.date(from: afspraak.datum)
                }
                if (calendar.isDate(afspraakDatum!, equalTo: currentDate, toGranularity: .minute)) {
                    return true
                }
                return false

            }
            if conflict.isEmpty {
                timeSlots.append(currentDate)
            }
            currentDate = calendar.date(byAdding: .minute, value: 15, to: currentDate) ?? Date()
        }
        return timeSlots
    }
}
