struct Patiënt: Codable {
    let gebruikerId: String
    let email: String
    let telefoonnummer: String
    let straat: String
    let huisnummer: Int
    let stad: String
    let postcode: Int
}
struct PatiëntResponse: Decodable {
    let patientId: String
}
