struct ArtikelsResponse: Decodable{
    let result: [Artikel]
}

struct Artikel: Identifiable, Decodable{
    let id: String
    let titel: String
    let text: String
    let image: String
    let created: String
}
