//
//  ResumeMock.swift
//  SkillsOnly
//
//  Created by Apprenant 132 on 12/03/2025.
//

import Foundation

let resumesList : [Resume] = [resumeMock1, resumeMock2, resumeMock3, resumeMock4, resumeMock5, resumeMock6, resumeMock7, resumeMock8, resumeMock9]

let experienceMock1 = Experience(
    name: "Test iOS",
    datesBegin: "2022.10.22",
    dateEnd: "2024.07.14",
    description: "Je testais des applications iOS pendent deux ans dans une grande entreprise du secteur inductriel."
)

let experienceMock2 = Experience(
    name: "Test Android",
    datesBegin: "2020.09.02",
    dateEnd: "2022.07.08",
    description: "Je testais des applications Android pendent deux ans dans une grande entreprise du secteur industriel."
)

let experienceMock3 = Experience(
    name: "Designer UX UI",
    datesBegin: "2022.10.22",
    dateEnd: "2024.07.14",
    description: "J'étais UX UI Designer pour les applications iOS pendent deux ans dans une grande entreprise de la tech."
)

let skillMock1 = Skills(
    name: "iOS dev",
    level: 4
)
let skillMock2 = Skills(
    name: "SwiftUI",
    level: 5
)

let skillMock3 = Skills(
    name: "Graphisme",
    level: 4
)

let skillMock4 = Skills(
    name: "UX UI Design",
    level: 3
)

let educationMock1 = Education(
    name: "Ingénieur",
    datesBegin: "2019.09.02",
    dateEnd: "2021.07.08",
    description: "Ingénieur en informatique"
)

let educationMock2 = Education(
    name: "Graphiste",
    datesBegin: "2019.09.02",
    dateEnd: "2021.07.08",
    description: "Ecole en graphisme"
)

let resumeEmpty = Resume(jobTitle: "", experience: [], descrip: "", image: "", tags: [], city: "", skills: [], education: [], tel: "", address: "", date: "")

let resumeMock1 = Resume(
    id: UUID(),
    jobTitle: "Développeur iOS",
    experience: [experienceMock1, experienceMock2],
    descrip: "Développeur passionné par la technologie",
    image: "apple.terminal.circle.fill",
    tags: ["iOS", "Swift", "Xcode"],
    city: "Paris",
    skills: [skillMock1, skillMock2],
    education: [educationMock1],
    tel: "0123456789",
    address: "123 Rue Exemple, Paris",
    date: "2025.03.13"
)

let resumeMock2 = Resume(
    id: UUID(),
    jobTitle: "Designer UX/UI",
    experience: [experienceMock3],
    descrip: "Designer avec 5 ans d'expérience dans le domaine des interfaces utilisateurs",
    image: "pencil.and.outline",
    tags: ["UX/UI", "Figma", "Sketch"],
    city: "Lyon",
    skills: [skillMock3, skillMock4],
    education: [educationMock2],
    tel: "0987654321",
    address: "45 Rue de Design, Lyon",
    date:"2025.03.13"
)

let resumeMock3 = Resume(
    id: UUID(),
    jobTitle: "Ingénieur en Intelligence Artificielle",
    experience: [],
    descrip: "Passionné par le Machine Learning et le Deep Learning.",
    image: "apple.image.playground.fill",
    tags: ["Python", "TensorFlow", "IA"],
    city: "Toulouse",
    skills: [],
    education: [],
    tel: "0765432109",
    address: "12 Avenue des Sciences, Toulouse",
    date: "2025.03.12"
    
)

let resumeMock4 = Resume(
    id: UUID(),
    jobTitle: "Chef de Projet Marketing Digital",
    experience: [],
    descrip: "Expert en stratégie digitale, SEO et gestion des campagnes publicitaires.",
    image: "checkmark.seal.text.page.fill.rtl",
    tags: ["Marketing", "SEO", "Google Ads"],
    city: "Marseille",
    skills: [],
    education: [],
    tel: "0654321098",
    address: "78 Boulevard du Web, Marseille",
    date: "2025.03.12"
)

let resumeMock5 = Resume(
    id: UUID(),
    jobTitle: "Consultant en Cybersécurité",
    experience: [],
    descrip: "Spécialiste en sécurité des systèmes informatiques et en prévention des cyberattaques.",
    image: "oar.2.crossed.circle.fill",
    tags: ["Cybersecurity", "Ethical Hacking", "Réseaux"],
    city: "Lille",
    skills: [],
    education: [],
    tel: "0743210987",
    address: "5 Rue de la Sécurité, Lille",
    date: "2025.03.12"
)

let resumeMock6 = Resume(
    id: UUID(),
    jobTitle: "Médecin Généraliste",
    experience: [],
    descrip: "Médecin expérimenté, passionné par la santé et le bien-être des patients.",
    image: "waveform.path.ecg.text.page.fill",
    tags: ["Médecine", "Diagnostic", "Soins"],
    city: "Nice",
    skills: [],
    education: [],
    tel: "0632109876",
    address: "99 Avenue de la Santé, Nice",
    date: "2025.03.11"
)

let resumeMock7 = Resume(
    id: UUID(),
    jobTitle: "Architecte",
    experience: [],
    descrip: "Créatif et passionné par le design et la conception d'espaces modernes.",
    image: "oar.2.crossed",
    tags: ["Architecture", "Design", "Urbanisme"],
    city: "Bordeaux",
    skills: [],
    education: [],
    tel: "0621098765",
    address: "34 Rue des Bâtisseurs, Bordeaux",
    date: "2025.03.10"
)

let resumeMock8 = Resume(
    id: UUID(),
    jobTitle: "Avocat en Droit des Affaires",
    experience: [],
    descrip: "Expert en droit des entreprises et en négociation de contrats.",
    image: "hammer.circle.fill",
    tags: ["Droit", "Entreprise", "Contrats"],
    city: "Strasbourg",
    skills: [],
    education: [],
    tel: "0610987654",
    address: "25 Rue du Palais, Strasbourg",
    date: "2025.03.12"
)

let resumeMock9 = Resume(
    id: UUID(),
    jobTitle: "Enseignant en Mathématiques",
    experience: [],
    descrip: "Pédagogue passionné, spécialisé en algèbre et en analyse.",
    image: "person.circle",
    tags: ["Mathématiques", "Pédagogie", "Éducation"],
    city: "Lyon",
    skills: [],
    education: [],
    tel: "0609876543",
    address: "7 Rue du Savoir, Lyon",
    date: "2025.03.09"
)
