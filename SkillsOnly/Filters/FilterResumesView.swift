//
//  FiltersResumesView.swift
//  SkillsOnly
//
//  Created by Apprenant 132 on 12/03/2025.
//

import SwiftUI

enum placeFilter: String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString }
    case paris = "Paris"
    case lyon = "Lyon"
    case bordeaux = "Bordeaux"
    case nice = "Nice"
    case newyork = "New York"
    case london = "London"
}

enum skillsFilter: String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString }
    case iosdev = "iOS dev"
    case androiddev = "Android dev"
    case python = "Python"
}

enum jobTitlesFilter: String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString}
    case devios = "Développeur iOS"
    case devandroid = "Développement Android"
    case design = "Designer UX/UI"
    case medecin = "Médecin Généraliste"
}

let listOfPlaces = placeFilter.allCases.map { $0.rawValue }
let listOfSkills = skillsFilter.allCases.map { $0.rawValue }
let listOfJobTitles = jobTitlesFilter.allCases.map { $0.rawValue }

struct FilterResumesView: View {
    
    @Binding var selectedPlaces: Set<String>
    @Binding var selectedSkills: Set<String>
    @Binding var selectedJobs: Set<String>
    
    var body: some View {
        
        ScrollView([.horizontal]) {
            HStack{
                MyPickerView(listOfSelectedItems: $selectedJobs, listOfChoiceItems: listOfJobTitles, listOfChoicesTitle: "Postes")
                MyPickerView(listOfSelectedItems: $selectedSkills, listOfChoiceItems: listOfSkills, listOfChoicesTitle: "Compétences")
                MyPickerView(listOfSelectedItems: $selectedPlaces, listOfChoiceItems: listOfPlaces, listOfChoicesTitle: "Villes")
            }
            
        }
        .padding()
    }
}

#Preview {
    FilterResumesView(selectedPlaces: .constant([]), selectedSkills: .constant([]), selectedJobs: .constant([]))
}
