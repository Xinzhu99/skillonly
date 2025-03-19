import SwiftUI

struct CreateOfferView: View {
    @State private var jobTitle: String = ""
    @State private var contractType: String = ""
    @State private var company: String = ""
    @State private var city: String = ""
    @State private var description: String = ""
    @State private var tagsInput: String = ""
    @State private var salaryMin: String = ""
    @State private var salaryMax: String = ""
    @State private var postedAt: String = ""
    @State private var confirmOfferModal: Bool = false

    func addOffer() {
        let newOffer = Offers(
            company: company,
            image: "briefcase.fill",
            jobTitle: jobTitle,
            city: city.isEmpty ? "Ville non spécifiée" : city,
            salaryMin: Int(salaryMin) ?? 0,
            salaryMax: Int(salaryMax) ?? 0,
            tags: tagsInput.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) },
            contractType: contractType,
            description: description.isEmpty ? "Aucune description fournie." : description,
            profile: "", postedAt: postedAt.isEmpty ? "Aujourd’hui" : postedAt,
            applications: []
        )
        
        offersList.append(newOffer)

//        print("Nouvelle offre ajoutée !")
//        print("Nombre total d'offres : \(offersList.count)")

        confirmOfferModal = true
    }

    var body: some View {
        NavigationStack{
        ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Spacer()
                    //Text("Offre")
                    //                    .font(.title)
                    //                    .fontWeight(.bold)
                    //                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    Group {
                        CustomTextField(placeholder: "Nom du poste", text: $jobTitle)
                        CustomTextField(placeholder: "Type de contrat", text: $contractType)
                        CustomTextField(placeholder: "Entreprise", text: $company)
                        CustomTextField(placeholder: "Ville", text: $city)
                    }
                    
                    Group {
                        Text("Plus d’informations")
                        TextEditor(text: $description)
                            .frame(height: 80)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color("Mygreen"), lineWidth: 1))
                    }
                    .padding(.horizontal)
                    
                    CustomTextField(placeholder: "Tags (séparés par des virgules)", text: $tagsInput)
                    Text("Rémunération").padding(.horizontal)
                    
                    Group {
                        HStack {
                            Text("min").padding(.horizontal)
                            TextField("Salaire minimum", text: $salaryMin)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                                .padding(.horizontal)
                            Text("max")
                            TextField("Salaire maximum", text: $salaryMax)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                                .padding(.horizontal)
                        }
                        
                        CustomTextField(placeholder: "Date d'ajout", text: $postedAt)
                    }
                    
                    Button(action: addOffer) {
                        Text("Publier")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("Mygreen"))
                            .cornerRadius(8)
                    }
                    .padding(.top)
                    
                    Spacer()
                }
                .navigationTitle("Offers")
                .padding()
            }
            .sheet(isPresented: $confirmOfferModal) {
                OfferConfirm()
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

// Composant réutilisable pour les champs du formulaire
struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            //.background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color("Mygreen"), lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

#Preview {
    CreateOfferView()
}
//struct modal aprés la soumission du formulaire
struct OfferConfirm: View {
    let logo: String = "Logo"
    @Environment(\.dismiss) var dismissModal

    var body: some View {
        VStack {
            HStack {
                Spacer() // Pousse le bouton à droite
                Button(action: {
                    dismissModal() // Ferme le modal
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.gray) 
                }
                .padding()
            }
        }
                   Spacer()
        VStack {
            Image(logo)
                .resizable()
                .frame(width: 200, height: 80)
                .padding(.bottom, 50)
            Text("Votre Offre a été publié ✅")
        }
        Spacer()

    }
}
