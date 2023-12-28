import Foundation

class ApiService {
    static let shared = ApiService()
    
//    self signed certificate
    private let baseURL = "https://ac45-193-191-158-19.ngrok-free.app/api"
    
    private init() {}
    
    func postGebruiker(gebruikerPush: GebruikerPush) async throws -> GebruikerResponse {
        let url = URL(string: "\(baseURL)/gebruiker")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(gebruikerPush)

        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(GebruikerResponse.self, from: data)
    }
    
    func postPatiënt(patiënt: Patiënt) async throws -> PatiëntResponse {
        let url = URL(string: "\(baseURL)/patient")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(patiënt)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(PatiëntResponse.self, from: data)
    }
    
    func getArtikels() async throws -> [Artikel] {
        let data = try await urlSession("\(baseURL)/artikel")
        do {
            let decoded = try JSONDecoder().decode([Artikel].self, from: data)
            return decoded
        } catch {
            print("Error decoding artikels: \(error)")
            throw error
        }
    }
    
    func getOogZiektes() async throws -> [OogZiekte] {
        let data = try await urlSession("\(baseURL)/oogziekte")
        do {
            let decoded = try JSONDecoder().decode([OogZiekte].self, from: data)
            return decoded
        } catch {
            print("Error decoding oogziektes: \(error)")
            throw error
        }
    }
    
    func getArtsen() async throws -> [Arts] {
        let data = try await urlSession("\(baseURL)/arts")
        do {
            let decoded = try JSONDecoder().decode([Arts].self, from: data)
            print("test" , decoded)

            return decoded
        } catch {
            print("Error decoding artsen: \(error)")
            throw error
        }
    }
    
    func getFAQ() async throws -> [FAQ] {
        let data = try await urlSession("\(baseURL)/faq")
        do {
            let decoded = try JSONDecoder().decode([FAQ].self, from: data)
            return decoded
        } catch {
            print("Error decoding FAQ: \(error)")
            throw error
        }
    }
    
    func urlSession(_ url: String) async throws -> Data {
        let url = URL(string: url)!
        
        let configuration = URLSessionConfiguration.ephemeral
        let delegate = SelfSignedURLSessionDelegate()
        let session = URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
        let (data, _) = try await session.data(from: url)
        return data
    }
}

class SelfSignedURLSessionDelegate: NSObject, URLSessionDelegate {
    func urlSession(
        _ session: URLSession,
        didReceive challenge: URLAuthenticationChallenge,
        completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void
    ) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            completionHandler(.useCredential, credential)
        } else {
            completionHandler(.performDefaultHandling, nil)
        }
    }
}





