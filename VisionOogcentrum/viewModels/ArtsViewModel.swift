//
//  ArtsViewModel.swift
//  VisionOogcentrum
//
//  Created by Arnaud De Weghe on 22/11/2023.
//

import Foundation
import Combine

class ArtsViewModel: ObservableObject {
    @Published var artsen: [Arts] = []
    private let artsRepository: ArtsRepository
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        self.artsRepository = NetworkArtsRepository()
        setupObserving()
    }
    private func setupObserving() {
        $artsen
            .receive(on: DispatchQueue.main)
            .sink { _ in }
            .store(in: &cancellables)
    }
    
    func fetchArtsen() async {
        do {
            let fetchedArtsen = try await
            artsRepository.getAllArtsen()
            DispatchQueue.main.async {
                self.artsen = fetchedArtsen
            }
        } catch {
            print("Error fetching artsen: \(error)")

        }
    }
}
