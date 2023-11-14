//
//  ArtikelViewModel.swift
//  VisionOogcentrum
//
//  Created by Arnaud De Weghe on 14/11/2023.
//
import Foundation
class ArtikelViewModel: ObservableObject {
    @Published var artikels: [Artikel] = []

    func fetchArtikels() async {
        do {
            self.artikels = try await getArtikels()
        } catch{
            print("Error fetching artikels: \(error)")
        }
    }
}
