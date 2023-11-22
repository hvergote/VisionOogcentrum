struct ArtsResponse: Decodable {
    let result: [Arts]
}

struct Arts: Decodable {
    let naam: String
    let voornaaam: String
    let profilePicture: String
    let specialisatieDtos: [Specialisatie]?
}

struct Specialisatie: Decodable {
    let naam: String
}
