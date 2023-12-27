import Foundation
import SwiftUI

struct AfspraakBevestigingView: View {
    
    @StateObject private var viewModel = AfspraakViewModel()
    @State var naam: String = ""
    @State var voornaam: String = ""
    @State var email: String = ""
    @State var telefoonnummer: String = ""
    @State var straat: String = ""
    @State var huisnummer: Int = 0
    @State var postcode: Int = 0
    @State var stad: String = ""
    @State var extraInfo: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Gegevens: ")) {
                    TextField("Naam", text: $naam)
                        .font(.body)
                    TextField("Voornaam", text: $voornaam)
                        .font(.body)
                    TextField("Email", text: $email)
                        .font(.body)
                    TextField("Telefoonnummer", text: $telefoonnummer)
                        .font(.body)
                }
                Section(header: Text("Adres: ")) {
                    TextField("Straat", text: $straat)
                        .font(.body)
                    TextField("Huisnummer", text: Binding(get: {
                        String(huisnummer)
                    }, set: {
                        huisnummer = Int($0) ?? 0
                    }))
                    .font(.body)
                    TextField("Postcode", text: Binding(get: {
                        String(postcode)
                    }, set: {
                        postcode = Int($0) ?? 0
                    }))
                    .font(.body)
                    TextField("Stad", text: $stad)
                        .font(.body)
                }
                Section(header: Text("Extra informatie: ")) {
                    TextField("Exta informatie: ", text: $extraInfo)
                        .font(.body)
                }
                Button("Submit") {
                    Task {
                        do {
                            _ = try await viewModel.postGebruiker(naam: naam, voornaam: voornaam)
                            _ = try await viewModel.postPatiënt(telefoonnummer: telefoonnummer, email: email, straat: straat, huisnummer: huisnummer, stad: stad, postcode: postcode)
                        } catch {
                            print("Error: \(error)")
                        }
                    }
                }
                
            }
            .navigationTitle("Afspraak Bevestiging")
        }
    }
}
