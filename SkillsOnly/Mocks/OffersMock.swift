//
//  OffersMock.swift
//  skillsOnly
//
//  Created by Apprenant174 on 10/03/2025.
//

import Foundation

var offersList : [Offers] = [offerMock1, offerMock2, offerMock3, offerMock4, offerMock5, offerMock6]

let offerMock1 = Offers(
    company: "Apple",
    image: "apple.logo",
    jobTitle: "Développeur·se iOS",
    city: "New York",
    salaryMin: 150000,
    salaryMax: 300000,
    tags: ["iOS", "Swift"],
    contractType: "CDI",
    description: "- Développer l'application. \r- Réaliser les tests, corriger les bugs. \r- Déployer l'application sur l'App Store. Réaliser le suivi, la prise en main par les utilisateurs. \r- Collaborer avec les équipes design et backend pour l'ajout de nouvelles fonctionnalités.",
    profile : "- Architecture iOS : Swift(99%), architecture propre + MVVM, SPM multi-module\r- Tests : Tests unitaires, tests E2E\r- CI/CD : Fastlane, Bitrise\r- Outils : Xcode, SPM, Github, SwiftLint, Firebase\r- Produits : application iOS, widgets iOS",
    postedAt: "2025.02.25",
    applications: []
)

let offerMock2 = Offers(
    company: "Google",
    image: "a.circle",
    jobTitle: "Développeur·se Android",
    city: "Paris",
    salaryMin: 20000,
    salaryMax: 800000,
    tags: ["Android", "Kotlin"],
    contractType: "CDI",
    description: "Nous cherchons un·e developpeur·se pour travailler sur notre application Android",
    profile : "",
    postedAt: "2025.03.01",
    applications: []
)

let offerMock3 = Offers(
    company: "Apple",
    image: "apple.logo",
    jobTitle: "Développeur·se iOS",
    city: "Paris",
    salaryMin: 45000,
    salaryMax: 60000,
    tags: ["Swift", "Xcode", "iOS"],
    contractType: "CDI",
    description: "Nous recherchons une personne passionnée par le développement iOS pour concevoir des applications accessibles et innovantes pour tou·te·s.",
    profile : "",
    postedAt: "2025.03.10",
    applications: []
)

let offerMock4 = Offers(
    company: "Google",
    image: "a.circle",
    jobTitle: "Développeur·se Android",
    city: "Lyon",
    salaryMin: 42000,
    salaryMax: 58000,
    tags: ["Kotlin", "Android Studio", "Jetpack Compose"],
    contractType: "CDI",
    description: "Google France cherche un·e développeur·se Android expérimenté·e pour créer des solutions mobiles performantes et inclusives.",
    profile : "",
    postedAt: "2025.03.08",
    applications: []
)

let offerMock5 = Offers(
    company: "Ubisoft",
    image: "gamecontroller.fill",
    jobTitle: "Game Design",
    city: "Bordeaux",
    salaryMin: 40000,
    salaryMax: 55000,
    tags: ["Unity", "Game Design", "Level Design"],
    contractType: "CDD",
    description: "Nous recherchons un·e Game Designer pour imaginer des expériences de jeu immersives et accessibles à un large public.",
    profile : "",
    postedAt: "2025.03.05",
    applications: []
)

let offerMock6 = Offers(
    company: "Tesla",
    image: "car.fill",
    jobTitle: "Ingénierie Systèmes Embarqués",
    city: "Nice",
    salaryMin: 50000,
    salaryMax: 70000,
    tags: ["C++", "IoT", "Automobile"],
    contractType: "CDI",
    description: "Tesla recrute un·e ingénieur·e en systèmes embarqués pour participer à l’amélioration des logiciels de ses véhicules autonomes et durables.",
    profile : "",
    postedAt: "2025.03.02",
    applications: []
)
