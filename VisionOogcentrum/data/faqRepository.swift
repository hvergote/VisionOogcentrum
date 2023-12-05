//
//  faqRepository.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 05/12/2023.
//

import Foundation

protocol FAQRepository {
    func getAllFAQs() async throws -> [FAQ]
}

class NetworkFAQRepository: FAQRepository {
    func getAllFAQs() async throws -> [FAQ] {
        return try await ApiService.shared.getFAQ()
    }
}
