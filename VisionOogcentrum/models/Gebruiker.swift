struct Gebruiker: Codable {
    let id: String?
    let naam: String
    let voornaam: String
}

struct GebruikerPush: Codable {
    let naam: String
    let voornaam: String
}

struct GebruikerResponse: Decodable{
    let gebruikerId: String
}
