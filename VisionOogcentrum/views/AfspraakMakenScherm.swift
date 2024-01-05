import Foundation
import SwiftUI

struct AfspraakMakenScherm: View {
    
    @EnvironmentObject var afspraakViewModel: AfspraakViewModel
    @StateObject private var artsViewModel = ArtsViewModel()
    
    @State private var isAfspraakBevestigenSchermPresented = false
    @State private var chosenDate = Date()
    @State private var selectedArtsIndex = 0
    @State private var selectedArts: Arts = Arts(id: "", gebruiker: Gebruiker(id: "", naam: "", voornaam: ""), profilePicture: "", specialisaties: [], afspraken: [], info: "")
    @State private var selectedTijdstipIndex = 0
    @State var timeSlots: [Date] = []


    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Kies een datum").font(.body)){
                    DatePicker("Selecteer een datum", selection: $chosenDate, in: Date.now..., displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        .padding()
                        .font(.body)
                }.onChange(of: chosenDate) {
                    afspraakViewModel.updateData(date: chosenDate)
                    timeSlots = loadTimeslots()
                }

                Section(header: Text("Kies een dokter").font(.body)) {
                    Picker("Dokter", selection: $selectedArtsIndex) {
                        ForEach(0..<artsViewModel.artsen.count, id: \.self) { index in
                            Text(artsViewModel.artsen[index].gebruiker.naam)
                        }
                    }
                    .pickerStyle(.wheel)
                }.onChange(of: selectedArtsIndex) {
                    Task {
                        selectedArts = artsViewModel.artsen[selectedArtsIndex]
                        afspraakViewModel.selectedArts = selectedArts.gebruiker.naam
                        
                        await afspraakViewModel.getAfsprakenByArtsId(id: selectedArts.id)
                        timeSlots = loadTimeslots()
                    }
                }
                
                Section(header: Text("Kies een tijdstip").font(.body)) {
                    Picker("Tijdstip", selection: $selectedTijdstipIndex) {
                        ForEach(0..<timeSlots.count, id: \.self) { index in
                            Text(afspraakViewModel.getTijdstip(date: timeSlots[index]))
                        }
                    }
                    .pickerStyle(.wheel)
                }.onChange(of: selectedTijdstipIndex) {
                    afspraakViewModel.selectedDate = timeSlots[selectedTijdstipIndex]
                    afspraakViewModel.tijdstip = afspraakViewModel.getTijdstip(date: timeSlots[selectedTijdstipIndex])
                }
                    
                NavigationLink(destination: AfspraakBevestigingView(), isActive: $isAfspraakBevestigenSchermPresented) {
                    Button("Volgende") {
                        isAfspraakBevestigenSchermPresented = true
                    }
                    .font(.body)
                    }
            }
            .onAppear {
                Task {
                    await artsViewModel.fetchArtsen()
                    selectedArts = artsViewModel.artsen[selectedArtsIndex]
                    await afspraakViewModel.getAfsprakenByArtsId(id: selectedArts.id)
                    timeSlots = loadTimeslots()
                }
            }
            .navigationTitle("Afspraak maken")
        }
    }
    
    func loadTimeslots() -> [Date] {
        var timeSlots: [Date] = []
        
        let calendar = Calendar.current
        var currentDate = calendar.date(bySettingHour: 8, minute: 0, second: 0, of: chosenDate) ?? Date()
        
        let endOfDay = calendar.date(bySettingHour: 18, minute: 0, second: 0, of: chosenDate) ?? Date()
        
        let afspraken = afspraakViewModel.afsprakenByArtsId
        let datumFormatter = DateFormatter()
        datumFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let datumFormatter2 = DateFormatter()
        datumFormatter2.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS"
        
        while currentDate < endOfDay {
            let conflict = afspraken.filter { afspraak in
                var afspraakDatum = datumFormatter.date(from: afspraak.datum)
                if (afspraakDatum == nil) {
                    afspraakDatum = datumFormatter2.date(from: afspraak.datum)
                }
                if (calendar.isDate(afspraakDatum!, equalTo: currentDate, toGranularity: .minute)) {
                    return true
                }
                return false

            }
            if conflict.isEmpty {
                timeSlots.append(currentDate)
            }
            currentDate = calendar.date(byAdding: .minute, value: 15, to: currentDate) ?? Date()
        }
        return timeSlots
    }
    

}
