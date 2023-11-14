import Foundation

func getArtikels() async throws -> [Artikel]{
    //link werkt niet op localhost
    let url = URL(string: "https://localhost:7181/api/artikel")!

    let (data, _) = try await URLSession.shared.data(from: url)

    let decoded = try JSONDecoder().decode(ArtikelsResponse.self, from: data)

    return decoded.result
}
