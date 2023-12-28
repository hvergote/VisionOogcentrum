struct OogZiekteResponse: Decodable {
    let result: [OogZiekte]
}

struct OogZiekte: Identifiable, Codable {
    let id: String
    let titel: String
    let beschrijving: String
    let behandeling: String
}
