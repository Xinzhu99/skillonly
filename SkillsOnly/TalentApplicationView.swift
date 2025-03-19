//
//  ApplicationView.swift
//  SkillsOnly
//
//  Created by Apprenant174 on 14/03/2025.
//

import SwiftUI


struct TalentApplicationView: View {
    
    @Binding var isLoggedIn: Bool

    var talent: Talent // Le talent connecté
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    // Désactivation temporaire de la condition de connexion
                    // if isLoggedIn {
                    if !talent.applications.isEmpty {
                        //                    Text("Mes Candidatures")
                        //                        .font(.title)
                        //                        .bold()
                        //                        .padding()
                        
                        ForEach(talent.applications, id: \.self) { application in
                            ApplicationCard(isLoggedIn: $isLoggedIn, application: application)
                        }
                    } else {
                        Spacer()
                        Text("Vous n'avez pas encore postulé à une offre.")
                            .foregroundColor(.gray)
                            .padding()
                        Spacer()
                    }
                    // } else {
                    //    Text("Veuillez vous connecter pour voir vos candidatures")
                    //        .foregroundColor(.red)
                    //        .font(.headline)
                    //        .padding()
                    // }
                }
                Spacer()
                    .navigationTitle("Mes candidatures")
            }
        }
    }
}


// Composant d'affichage d'une candidature
struct ApplicationCard: View {
    @Binding var isLoggedIn: Bool

    var application: Application
    
    var body: some View {
        NavigationLink(destination: OfferDetailView(offer: application.offer, isLoggedIn: $isLoggedIn)){
            
            VStack(alignment: .leading) {
                HStack {
                    Text(application.status.uppercased())
                        .font(.caption)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            application.status == "Acceptée" ? Color.green :
                                application.status == "Refusée" ? Color.red :
                                application.status == "Envoyée" ? Color.blue :
                                Color.orange
                        )
                        .cornerRadius(10)
                    
                }
                
                Text(application.offer.jobTitle)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(application.offer.company)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    
                    Spacer()
                    Text("Postulé le \(application.applicationDate)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color("cardGreen").opacity(0.5))
            .cornerRadius(12)
            .padding(.horizontal, 10)
            
        }
    }
}

// Test avec un talent mocké
#Preview {
    TalentApplicationView(isLoggedIn: .constant(true), talent: talentMock1)
}

