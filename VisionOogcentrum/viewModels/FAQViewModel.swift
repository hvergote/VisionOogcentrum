//
//  FAQViewModel.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 05/12/2023.
//

import Foundation
import Combine

class FAQViewModel: ObservableObject {
    @Published var faqs: [FAQ] = []
    private let faqRepository: FAQRepository
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        self.faqRepository = NetworkFAQRepository()
        setupObserving()
    }
    
    private func setupObserving() {
        $faqs
            .receive(on: DispatchQueue.main)
            .sink { _ in }
            .store(in: &cancellables)
    }
    
    func fetchFaqs() async {
        do {
            let fetchedFaqs = try await faqRepository.getAllFAQs()
            DispatchQueue.main.async {
                self.faqs = fetchedFaqs
            }
        } catch {
            print("Error fetching FAQs: \(error)")
        }
    }
}
