//
//  ArtikelViewModel.swift
//  VisionOogcentrum
//
//  Created by Arnaud De Weghe on 14/11/2023.
//
import Foundation
import Combine

class ArtikelViewModel: ObservableObject {
    @Published var artikels: [Artikel] = []
    private let artikelRepository: ArtikelRepository
    private var cancellables: Set<AnyCancellable> = []

    init() {
        self.artikelRepository = NetworkArtikelRepository()
        setupObserving()
    }

    private func setupObserving() {
        $artikels
            .receive(on: DispatchQueue.main)
            .sink { _ in }
            .store(in: &cancellables)
    }
    
    func fetchArtikels() async {
        do {
            let fetchedArtikels = try await artikelRepository.getAllArtikels()
            DispatchQueue.main.async {
                self.artikels = fetchedArtikels
            }
        } catch {
            print("Error fetching artikels: \(error)")
        }
    }
}
