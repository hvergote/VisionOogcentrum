//
//  ArtikelViewModel.swift
//  VisionOogcentrum
//
//  Created by Arnaud De Weghe on 14/11/2023.
//
import Foundation
class ArtikelViewModel: ObservableObject {
    @Published var artikels: [Artikel] = []
    private let artikelRepository: ArtikelRepository

    init() {
        self.artikelRepository = NetworkArtikelRepository() // You can change this based on your needs
    }

    func fetchArtikels() async {
        do {
            artikels = try await artikelRepository.getAllArtikels()
        } catch {
            print("Error fetching artikels: \(error)")
        }
    }
}
