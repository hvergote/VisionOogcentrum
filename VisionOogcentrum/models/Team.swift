//
//  Team.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 14/11/2023.
//

import Foundation
struct Team: Identifiable, Decodable{
    let id: String
    let voornaam: String
    let naam: String
    let image: String
    
    init(voornaam: String, naam: String, image: String = "") {
        self.id = voornaam + naam
        self.voornaam = voornaam
        self.naam = naam
        self.image = image
    }
}
