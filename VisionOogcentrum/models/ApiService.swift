import Foundation

class ApiService {
    static let shared = ApiService()
    
    private let baseURL = "https://fd7c-78-23-244-204.ngrok-free.app/api"
    
    private init() {}
    
    func getArtikels() async throws -> [Artikel] {
        let url = URL(string: "\(baseURL)/artikel")!

        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decoded = try JSONDecoder().decode([Artikel].self, from: data)
            return decoded
        } catch {
            print("Error decoding artikels: \(error)")
            throw error
        }
    }
    
    func getOogZiektes() async throws -> [OogZiekte] {
        let url = URL(string: "\(baseURL)/oogziekte")!

        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decoded = try JSONDecoder().decode([OogZiekte].self, from: data)
            return decoded
        } catch {
            print("Error decoding oogziektes: \(error)")
            throw error
        }
    }
    func getArtsen() async throws -> [Arts] {
        let url = URL(string: "\(baseURL)/arts")!

        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decoded = try JSONDecoder().decode([Arts].self, from: data)
            return decoded
        } catch {
            print("Error decoding oogziektes: \(error)")
            throw error
        }
    }
}


