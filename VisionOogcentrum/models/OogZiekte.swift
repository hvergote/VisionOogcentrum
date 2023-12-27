struct OogZiekteResponse: Decodable {
    let result: [OogZiekte]
}

struct OogZiekte: Identifiable, Decodable {
    let id: String
    let titel: String
    let beschrijving: String
    let behandeling: String
}
