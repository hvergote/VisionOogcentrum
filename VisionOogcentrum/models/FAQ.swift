struct FAQResponse: Decodable {
    let result: [FAQ]
}

struct FAQ: Identifiable, Decodable {
    let id: String
    let vraag: String
    let antwoord: String
}
