//
//  OogZiekteViewModel.swift
//  VisionOogcentrum
//
//  Created by Arnaud De Weghe on 22/11/2023.
//

import Foundation
import Combine

class OogZiekteViewModel: ObservableObject {
    @Published var oogziektes: [OogZiekte] = []
    private let oogziekteRepository: OogZiekteRepository
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        self.oogziekteRepository = NetworkOogZiekteRepository()
        setupObserving()
    }
    private func setupObserving() {
        $oogziektes
            .receive(on: DispatchQueue.main)
            .sink { _ in }
            .store(in: &cancellables)
    }
    
    func fetchOogziektes() async {
        do {
            let fetchedOogziektes = try await
                oogziekteRepository.getAllOogziektes()
            DispatchQueue.main.async {
                self.oogziektes = fetchedOogziektes
            }
        } catch {
            print("Error fetching oogziektes: \(error)")

        }
    }
}
