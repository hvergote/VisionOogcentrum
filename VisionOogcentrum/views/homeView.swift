//
//  HomeView.swift
//  VisionOogcentrum
//
//  Created by Arnaud De Weghe on 17/10/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            List {
                /*
                 NavigationLink(destination: AfspraakMakenView()) {
                 Label("Afspraak maken", systemImage: "calendar.badge.plus")
                 }
                 NavigationLink(destination: OnsTeamView()) {
                 Label("Ons team", systemImage: "person.3")
                 }
                 NavigationLink(destination: MijnAfsprakenView()) {
                 Label("Mijn afspraken", systemImage: "calendar")
                 }
                 */
                NavigationLink(destination: NieuwsView()) {
                    Label("Nieuws", systemImage: "globe")
                }
                /*
                 NavigationLink(destination: BehandelingView()) {
                 Label("Behandeling", systemImage: "heart")
                 }
                 NavigationLink(destination: ContactView()) {
                 Label("Contact", systemImage: "envelope")
                 }
                 NavigationLink(destination: OogaandoeningenView()) {
                 Label("Oogaandoeningen", systemImage: "eye.trianglebadge.exclamationmark")
                 }*/
            }
        }
        .navigationTitle("Home")
    }
}


#Preview {
    HomeView()
}
