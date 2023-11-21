import Foundation

class ArtikelService {
    static let shared = ArtikelService()
    
    private init() {}
    
    func getArtikels() async throws -> [Artikel] {
        let url = URL(string: "https:/fd7c-78-23-244-204.ngrok-free.app/api/artikel")!

        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decoded = try JSONDecoder().decode([Artikel].self, from: data)
            return decoded
        } catch {
            print("Error decoding artikels: \(error)")
            throw error
        }
    }
}

