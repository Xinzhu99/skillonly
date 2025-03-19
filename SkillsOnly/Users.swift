//
//  Users.swift
//  SkillsOnly
//
//  Created by Apprenant 134 on 07/03/2025.
//

import Foundation


enum userTypeEnum: String {
    case talent
    case employer
    case nilUser
}

struct Talent: Identifiable {
    var id : String
    var email : String
    var password : String
    var favoriteOffers : [Offers]
    var cv : Resume
    var applications: [Application] // Liste des candidatures (offres auxquelles il a postulé)
    var messages: [Message]    // Liste des messages reçus par le talent
}

// Structure pour une candidature
struct Application: Hashable {
    var applicationDate: String   // La date de la candidature
    var status: String // Le statut de la candidature (Acceptée, Refusée, publié)
    var offer: Offers
    var cv: Resume
}

struct Employer: Identifiable {
    var id : String
    var email : String
    var password : String
    var favoriteCV : [Resume]
    var offers : [Offers]
    var applications: [Application] // Liste des candidatures pour une offre
    var messages: [Message]    // Liste des messages envoyés/ reçus par l'employeur
}

struct Message {
    var content: String        // Contenu du message
    var sentAt: String           // Date d'envoi du message
}
