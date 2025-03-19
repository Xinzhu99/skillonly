//
//  EmployerDashboardView.swift
//  SkillsOnly
//
//  Created by Apprenant174 on 14/03/2025.
//

import SwiftUI

//  Vue principale du Dashboard Employeur
struct EmployerDashboardView: View {
    @Binding var isLoggedIn: Bool
    var employer: Employer? // Recruteur connecté

    var body: some View {
        
        NavigationStack {
            VStack {
                // Désactivation temporaire de la condition de connexion
                // if isLoggedIn {
                    if let employer = employer,                   !employer.offers.isEmpty {
//                    Text("Mes Offres d'Emploi")
//                        .font(.title)
//                        .bold()
//                        .padding()

                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(employer.offers, id: \.id) { offer in
                                NavigationLink(destination: ApplicationListView(offer: offer, employer: employer, isLoggedIn: $isLoggedIn)) {
                                    OfferCard(offer: offer, isLoggedIn: $isLoggedIn)
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                } else {
                    Text("Vous n'avez pas encore créé d'offres.")
                        .foregroundColor(.gray)
                        .padding()
                }
                // } else {
                //    Text("Veuillez vous connecter pour voir vos offres")
                //        .foregroundColor(.red)
                //        .font(.headline)
                //        .padding()
                // }
            }
            .navigationTitle("Mes Offres d'Emploi")
            .padding(.top)
        }
    }
}

// Affichage d'une offre en détail
struct OfferCard: View {
    var offer: Offers
    @Binding var isLoggedIn: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(offer.jobTitle)
                .font(.title2)
                .bold()
                .foregroundColor(.black)

            Text(offer.company)
                .font(.headline)
                .foregroundColor(.blue)

            HStack {
                Image(systemName: "location.fill")
                Text(offer.city)
            }
            .foregroundColor(.red)

            HStack {
                Image(systemName: "dollarsign.circle.fill")
                Text("\(offer.salaryMin) - \(offer.salaryMax) €/mois")
            }
            .foregroundColor(.maxiGreen)
            .font(.headline)
            .bold()
            HStack {
                Image(systemName: "doc.text.fill")
                Text(offer.contractType)
            }
            .foregroundColor(.gray)
            .bold()

            // Tags de l'offre
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(offer.tags, id: \.self) { tag in
                        Text("#\(tag)")
                            .font(.callout)
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Color.maxiGreen.opacity(0.8))
                            .cornerRadius(8)
                    }
                }
            }

            //  Description de l'offre
            Text("📌 Description du poste")
                .font(.headline)
                .foregroundColor(.black)
                .bold()
            Text(offer.description)
                .font(.body)
                .foregroundColor(.black)
                .lineLimit(3)
            // Date de publication
            Text("🗓 Publiée le \(offer.postedAt)")
                .font(.caption)
                .foregroundColor(.gray)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color("cardGreen").opacity(0.5))
        .cornerRadius(12)
        .padding(.horizontal, 10)

    }
}

// Vue candidatures associées à une offre
struct ApplicationListView: View {
    var offer: Offers
    var employer: Employer?
    @Binding var isLoggedIn: Bool

    var body: some View {
        VStack (alignment: .leading, spacing: 8){
            Text("Candidatures pour \(offer.jobTitle)")
                .font(.title)
                .bold()
                .padding()

            let applications = offer.applications

            if applications.isEmpty {
                Text("Aucune candidature pour cette offre.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                ForEach(applications, id: \.applicationDate) { application in
                    ApplicationCardEm(isLoggedIn: $isLoggedIn, application: application)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        Spacer()
    }
}

// affichage d'une candidature
struct ApplicationCardEm: View {
    @State private var status: String = ""
    @Binding var isLoggedIn: Bool
    var application: Application

    // Initialisation de la vue avec une candidature spécifique
//    init(application: Application) {
//        self.application = application // On stocke la candidature passée en paramètre
//        
//        // Initialisation de la variable d'état `status` avec le statut actuel de la candidature
//        // _status est un wrapper permettant d'initialiser @State var status avec la valeur actuelle de application.status
//        _status = State(initialValue: application.status)
//    }


    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Statut de la candidature
            Text("📝 \(status.uppercased())") // Utilisation du @State
                .font(.caption)
                .bold()
                .foregroundColor(.white)
                .padding(6)
                .background(status == "Acceptée" ? Color.green :
                                status == "Refusée" ? Color.red : Color.blue)
                .cornerRadius(8)

            Text("📌 Offre : \(application.offer.jobTitle)")
                .font(.headline)
                .foregroundColor(.black)

            Text("📅 Postulé le \(application.applicationDate)")
                .font(.caption)
                .foregroundColor(.gray)

            // Voir le CV
            NavigationLink(destination: ResumeDetailView(resume: application.cv, isLoggedIn: $isLoggedIn)) {
                HStack {
                    Image(systemName: "doc.text.magnifyingglass")
                        .foregroundColor(.white)
                    Text("Visualiser le CV")
                        .fontWeight(.semibold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 3)
            }
            .padding(.top, 5)


            // Boutons pour modifier le statut
            HStack {
                Button(action: {
                    status = "Acceptée"
                }) {
                    Text("✅ Accepter")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    status = "Refusée"
                }) {
                    Text("❌ Refuser")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 5)

        }
        .padding()
        .background(Color("cardGreen").opacity(0.5))
        .cornerRadius(12)
        .padding(.horizontal, 10)
    }
}


// Test avec un employeur mocké
#Preview {
    EmployerDashboardView(isLoggedIn: .constant(false), employer: employerMock1)
}
