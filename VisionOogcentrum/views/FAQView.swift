//
//  FAQView.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 05/12/2023.
//

import SwiftUI

struct FAQView: View {
    let faqs: [FAQ] = [FAQ(id: "1", vraag: "Hoelaat is het?", antwoord: "Het is 16u10."), FAQ(id: "2", vraag: "Welke dag is het", antwoord: "Het is dinsdag")]
    @StateObject private var viewModel = FAQViewModel()
    
    var body: some View {
        List(viewModel.faqs) { item in
            DisclosureGroup(item.vraag) {
                Text(item.antwoord)
            }
            .font(.body)
        }.onAppear {
            Task {
                await viewModel.fetchFaqs()
            }
        }
    }
}

#Preview {
    FAQView()
}
