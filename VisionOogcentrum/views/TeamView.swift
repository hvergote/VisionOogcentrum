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
        Text(persoon.voornaam + " " + persoon.naam)
    }
}
#Preview {
    TeamView()
}
