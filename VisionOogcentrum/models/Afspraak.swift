struct Afspraak: Codable {
    let id: String
    let datum: String
    let extraInfo: String?
    let startTijd: String
    let eindTijd: String
    let patientId: String
    let artsId: String
}
