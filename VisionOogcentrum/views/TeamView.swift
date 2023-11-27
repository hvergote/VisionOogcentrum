//
//  TeamView.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 14/11/2023.
//
import SwiftUI
struct TeamView: View {
    let datasource = DataSource()
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))]) {
                ForEach(datasource.team) { persoon in
                    TeamPersoonView(persoon: persoon)
                }
            }
        }
            .navigationTitle("Team")
    }
}
struct TeamPersoonView: View {
    var persoon: Team

    var body: some View {
        VStack(spacing: 10) {
            Text(persoon.voornaam + " " + persoon.naam)
                .font(.title)
                .foregroundColor(.primary)
            
            AsyncImage(url: persoon.image) { phase in
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
