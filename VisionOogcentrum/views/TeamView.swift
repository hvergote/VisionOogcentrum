//
//  TeamView.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 14/11/2023.
//
import SwiftUI
struct TeamView: View {
    let datasource = DataSource()
    @StateObject private var viewModel = ArtsViewModel()
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 200))
            ]) {
                ForEach(viewModel.artsen) { persoon in
                    TeamPersoonView(persoon: persoon)
                }
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
        VStack(spacing: 10) {
            Text(persoon.gebruiker.voornaam + " " + persoon.gebruiker.naam)
                .font(.title)
                .foregroundColor(.primary)
            
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
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .frame(width: 200, height: 250)
    }
}

#Preview {
    TeamView()
}
