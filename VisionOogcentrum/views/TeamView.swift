//
//  TeamView.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 14/11/2023.
//
import SwiftUI
struct TeamView: View {
    let datasource = DataSource()
    @State private var selectedArts: Arts? = nil
    @StateObject private var viewModel = ArtsViewModel()
    
    private let teamCardHeight: CGFloat = 250
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 200)),
                GridItem(.adaptive(minimum: 200))
            ]) {
                ForEach(viewModel.artsen) { persoon in
                    TeamPersoonView(persoon: persoon)
                        .frame(height: teamCardHeight)
                        .onTapGesture {
                            selectedArts = persoon
                        }
                }
            }
            .padding()
            .sheet(item: $selectedArts) { arts in
                TeamPersoonDetailView(persoon: arts)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchArtsen()
            }
        }
        .navigationTitle("Team")
    }
}

struct TeamPersoonView: View {
    var persoon: Arts
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 8)
            Group {
                base.shadow(radius: 4)
                base.fill(Color("BackgroundColor"))
                VStack {
                    Text(persoon.gebruiker.naam + " " + persoon.gebruiker.voornaam)
                        .font(.title3)
                        .foregroundColor(.primary)
                        .padding()
                        .frame(height: 75)
                    AsyncImage(url: URL(string: persoon.profilePicture)) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .cornerRadius(8)
                        case .failure:
                            Color.gray
                        case .empty:
                            ProgressView()
                        @unknown default:
                            ProgressView()
                        }
                    }
                }
            }
        }
    }
}

struct TeamPersoonDetailView: View {
    var persoon: Arts
    
    var body: some View {
        Text("\(persoon.gebruiker.naam) \(persoon.gebruiker.voornaam)")
            .padding()
        ScrollView {
            if (persoon.info.isEmpty) {
                Info(info: "Geen extra info beschikbaar")
                    
            } else {
                Info(info: persoon.info)
            }
        }
    }
}

struct Info: View {
    var info: String
    var body: some View {
        Text(info)
            .font(.body)
            .padding()
    }
}

#Preview {
    TeamView()
}
