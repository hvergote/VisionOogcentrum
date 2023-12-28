import Foundation
import SwiftUI

struct AfspraakMakenScherm: View {
    
    @StateObject private var afspraakViewModel = AfspraakViewModel()
    @StateObject private var artsViewModel = ArtsViewModel()
    
    @State private var isAfspraakBevestigenSchermPresented = false
    @State private var chosenDate = Date()
    @State private var selectedArtsIndex = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Kies een datum").font(.body)){
                    DatePicker("Selecteer een datum", selection: $chosenDate, displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        .padding()
                        .font(.body)
                }

                Section(header: Text("Kies een dokter").font(.body)) {
                    Picker("Dokter", selection: $selectedArtsIndex) {
                        ForEach(0..<artsViewModel.artsen.count, id: \.self) { index in
                            Text(artsViewModel.artsen[index].gebruiker.naam)
                        }
                    }
                    .pickerStyle(.wheel)
                    }
                    
                    NavigationLink(destination: AfspraakBevestigingView(), isActive: $isAfspraakBevestigenSchermPresented) {
                        Button("Volgende") {
                            isAfspraakBevestigenSchermPresented = true
                        }
                    }
                }
                .navigationBarTitle("Afspraak Maken")
                .onAppear {
                    Task {
                        await artsViewModel.fetchArtsen()
                    }
                }
            }
        }
    }
