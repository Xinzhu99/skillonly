//
//  TalentMock.swift
//  skillsOnly
//
//  Created by Apprenant174 on 10/03/2025.
//

import Foundation

let listTalent: [Talent] = [talentMock1, talentMock2, talentMock3, talentMock4, talentMock5, talentMock6, talentMock7, talentMock8, talentMock9]

let talentEmpty = Talent(id: "", email: "", password: "", favoriteOffers: [], cv: resumeEmpty, applications: [], messages: [])

// Talent 1
let talentMock1 = Talent(
    id: "talentMock1",
    email: "jojo.milesi@icloud.com",
    password: "mysecuredpassword",
    favoriteOffers: [],
    cv: resumeMock1,
    applications: [applicationMock1, applicationMock2,applicationMock3 ],
    messages: []
)

// Talent 2
let talentMock2 = Talent(
    id: "talentMock2",
    email: "jane.doe@example.com",
    password: "password123",
    favoriteOffers: [],
    cv: resumeMock2,
    applications: [applicationMock3, applicationMock4],
    messages: []
)

// Talent 3 - Ingénieur en Intelligence Artificielle
let talentMock3 = Talent(
    id: "talentMock3",
    email: "ai.expert@gmail.com",
    password: "aiSecurePass",
    favoriteOffers: [],
    cv: resumeMock3,
    applications: [applicationMock5],
    messages: []
)

// Talent 4 - Chef de Projet Marketing Digital
let talentMock4 = Talent(
    id: "talentMock4",
    email: "marketing.pro@gmail.com",
    password: "marketingPass",
    favoriteOffers: [],
    cv: resumeMock4,
    applications: [applicationMock6],
    messages: []
)

// Talent 5 - Consultant en Cybersécurité
let talentMock5 = Talent(
    id: "talentMock5",
    email: "cyber.secure@outlook.com",
    password: "cyberPass",
    favoriteOffers: [],
    cv: resumeMock5,
    applications: [applicationMock1, applicationMock4],
    messages: []
)

// Talent 6 - Médecin Généraliste
let talentMock6 = Talent(
    id: "talentMock6",
    email: "dr.medecin@gmail.com",
    password: "medecinPass",
    favoriteOffers: [],
    cv: resumeMock6,
    applications: [applicationMock2, applicationMock4],
    messages: []
)

// Talent 7 - Architecte
let talentMock7 = Talent(
    id: "talentMock7",
    email: "architecte.design@icloud.com",
    password: "archiPass",
    favoriteOffers: [],
    cv: resumeMock7,
    applications: [applicationMock3, applicationMock6],
    messages: []
)

// Talent 8 - Avocat en Droit des Affaires
let talentMock8 = Talent(
    id: "talentMock8",
    email: "avocat.pro@gmail.com",
    password: "avocatPass",
    favoriteOffers: [],
    cv: resumeMock8,
    applications: [applicationMock2, applicationMock4],
    messages: []
)

// Talent 9 - Enseignant en Mathématiques
let talentMock9 = Talent(
    id: "talentMock9",
    email: "prof.maths@education.com",
    password: "mathsPass",
    favoriteOffers: [],
    cv: resumeMock9,
    applications: [applicationMock3, applicationMock4, applicationMock6],
    messages: []
)
