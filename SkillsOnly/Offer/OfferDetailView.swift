//
//  TalentDetailView.swift
//  skillsOnly
//
//  Created by Apprenant174 on 11/03/2025.
//

import SwiftUI

struct OfferDetailView: View {
    var offer: Offers // Déclarer une variable pour reprendre les éléments de la structure Offers
    @State private var isShowingModal: Bool = false // Variable pour afficher le modal de confirmation de candidature
    @State private var addToFavorite: Bool = false // Variable pour ajouter au favoris
    @Binding var isLoggedIn: Bool // Vérifier si l'utilisateur est connecté
    @State private var hasApplied: Bool = false // Vérifier si l'utilisateur a déjà postulé
    var talent: Talent? // Le talent connecté
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // Contenu de l'offre
                VStack(alignment: .leading, spacing: 8) {
                    VStack {
                        Image(systemName: offer.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding()
                        
                        VStack(alignment: .leading) {
                            Text(offer.company)
                                .font(.title)
                                .bold()
                            Text(offer.jobTitle)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.black)
                            
                            HStack {
                                Image(systemName: "location.fill")
                                Text("\(offer.city)")
                            }
                            .font(.headline)
                            .foregroundColor(.gray)
                            
                            HStack {
                                Image(systemName: "dollarsign.circle.fill")
                                Text("\(offer.salaryMin) - \(offer.salaryMax) €/mois")
                            }
                            .foregroundColor(.green)
                            
                            HStack {
                                Image(systemName: "doc.text.fill")
                                Text(offer.contractType)
                            }
                            .foregroundColor(.blue)
                            
                            // Tags de l'offre
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(offer.tags, id: \.self) { tag in
                                        Text("#\(tag)")
                                            .font(.caption)
                                            .padding(6)
                                            .background(Color.blue.opacity(0.2))
                                            .cornerRadius(8)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    
                    // Description de l'offre et du profil recherché
                    Text("📌 Description du poste")
                        .font(.headline)
                    Text(offer.description)
                        .font(.body)
                        .foregroundColor(.black)
                        .lineLimit(3)
                    
                    Text("Profil recherché")
                        .font(.title)
                        .bold()
                    Text(offer.profile)
                    
                    Text("🗓 Publiée le \(offer.postedAt)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
            }
            //oici
            VStack(alignment: .center) {
                // Vérifier si l'utilisateur est connecté
                if isLoggedIn {
                    // Si l'utilisateur est connecté et n'a pas postulé, afficher le bouton "Postuler"
                    if !hasApplied {
                        Button {
                            isShowingModal.toggle()
                        } label: {
                            Text("Postuler")
                        }
                        .accessibilityIdentifier("PostulerButton")
                        .frame(width: 140, height: 40)
                        .padding()
                        .background(Color("Mygreen"))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .sheet(isPresented: $isShowingModal) {
                            ApplicationConfirm()
                                .presentationDetents([.medium, .large])
                        }
                    } else {
                        Text("Vous avez déjà postulé à cette offre.")
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding()
                    }
                } else {
                    // Si l'utilisateur n'est pas connecté, afficher un bouton qui redirige vers la page de connexion
                    //NavigationLink(destination: LogIn(isLoggedIn: $isLoggedIn)) {
                    Text("Connectez vous pour postuler")
//                        .frame(width: 140, height: 40)
//                        .padding()
//                        .background(Color("Mygreen"))
//                        .bold()
//                        .foregroundColor(.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .accessibilityIdentifier("PostulerButton")
                    //}
                }
            }
            .padding()
            .onAppear {
                checkIfApplied() // Vérifie si le talent a déjà postulé
            }
            .toolbar {
                Button {
                    addToFavorite.toggle()
                } label: {
                    Image(systemName: addToFavorite ? "heart.fill" : "heart")
                        .foregroundColor(Color("Mygreen"))
                }
            }
        }
    }
    
    // Fonction pour vérifier si le talent a déjà postulé
    func checkIfApplied() {
        if let talent = talent {
            // Vérifie si le talent a déjà postulé à l'offre
            hasApplied = talent.applications.contains { $0.offer.id == offer.id }
            //$0.offer.id signifie "l'ID de l'offre associée à l'élément courant dans la collection
        }
    }
}

#Preview {
    OfferDetailView(offer: offerMock1, isLoggedIn: .constant(false), talent: talentMock2) // test
}
