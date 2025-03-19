//
//  EmployerMock.swift
//  SkillsOnly
//
//  Created by Apprenant174 on 14/03/2025.
//

import Foundation

let listEmployer = [employerMock1, employerMock2]

let employerEmpty = Employer(id: "", email: "", password: "", favoriteCV: [], offers: [], applications: [], messages: [])

let employerMock1 = Employer(
    id: "employerMock1",
    email: "recruteur1@techcorp.com",
    password: "password123",
    favoriteCV: [],
    offers: [offerMock2, offerMock6],
    applications: [applicationMock1], // Les candidatures associées aux offres
    messages: [] // Messages échangés
)

let employerMock2 = Employer(
    id: "employerMock2",
    email: "recruteur2@businessplus.com",
    password: "password456",
    favoriteCV: [],
    offers: [offerMock3 , offerMock5],
    applications: [applicationMock4],
    messages: []
)
