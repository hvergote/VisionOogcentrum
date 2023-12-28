struct ArtsResponse: Decodable {
    let result: [Arts]
}

struct Arts: Identifiable, Decodable {
    let id: String
    let gebruiker: Gebruiker
    let profilePicture: String
    let specialisaties: [Specialisatie]?
    let info: String
}

struct Specialisatie: Decodable {
    let naam: String
}
