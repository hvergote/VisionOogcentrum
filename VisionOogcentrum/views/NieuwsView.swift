import Foundation
import SwiftUI

struct NieuwsView: View {
    @State private var selectedArtikel: Artikel? = nil
    @StateObject private var viewModel = ArtikelViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(viewModel.artikels) { artikel in
                    ArtikelView(artikel: artikel)
                        .onTapGesture {
                            selectedArtikel = artikel
                        }
                }
            }
            .padding()
            .sheet(item: $selectedArtikel) { selectedArtikel in
                DetailView(artikel: selectedArtikel)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchArtikels()
            }
        }
    }
}


struct ArtikelView: View {
    var artikel: Artikel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: artikel.image)) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 100)
                        .cornerRadius(8)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .foregroundColor(.red)
                @unknown default:
                    fatalError("Unknown case in AsyncImage")
                }
            }

            Text(artikel.titel)
                .font(.headline)

            Text(artikel.text)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

struct DetailView: View {
    var artikel: Artikel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: artikel.image)) { phase in
                    switch phase {
                    case .empty:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .cornerRadius(8)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .foregroundColor(.red)
                    @unknown default:
                        fatalError("Unknown case in AsyncImage")
                    }
                }

                Text(artikel.titel)
                    .font(.title)

                Text(artikel.text)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationTitle(artikel.titel)
    }
}


#Preview {
    NieuwsView()
}
