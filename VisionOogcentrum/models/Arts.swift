struct ArtsResponse: Decodable {
    let result: [Arts]
}

struct Arts: Identifiable, Codable {
    let id: String
    let gebruiker: Gebruiker
    let profilePicture: String
    let specialisaties: [Specialisatie]
    let afspraken: [Afspraak]
    let info: String
}

struct Specialisatie: Codable {
    let naam: String
    let oogziektes: [OogZiekte]
}
