//
//  FilterOffersView.swift
//  SkillsOnly
//
//  Created by Apprenant 132 on 14/03/2025.
//

import SwiftUI

enum contractTypesFilter: String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString }
    case cdi = "CDI"
    case cdd = "CDD"
    case stage = "Stage"
    case alternace = "Alternance"
}

enum companyFilter: String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString }
    case apple = "Apple"
    case google = "Google"
    case tesla = "Tesla"
    case ubisoft = "Ubisoft"
}

enum tagFilter: String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString }
    case kotlin = "Kotlin"
    case unity = "Unity"
    case swift = "Swift"
    case androidstudio = "Android Studio"
    case gamedesign = "Game Design"
}

let listOfContracts = contractTypesFilter.allCases.map { $0.rawValue }
let listOfCompanies = companyFilter.allCases.map { $0.rawValue }
// let listOfPlaces = placeFilter.allCases.map { $0.rawValue }

struct FilterOffersView: View {
    
    @Binding var selectedContracts: Set<String>
    @Binding var selectedCompanies: Set<String>
    @Binding var selectedPlaces: Set<String>
    
    var body: some View {
        
        ScrollView([.horizontal]) {
            HStack{
                MyPickerView(listOfSelectedItems: $selectedContracts, listOfChoiceItems: listOfContracts, listOfChoicesTitle: "Contrats")
                MyPickerView(listOfSelectedItems: $selectedCompanies, listOfChoiceItems: listOfCompanies, listOfChoicesTitle: "Entreprises")
                MyPickerView(listOfSelectedItems: $selectedPlaces, listOfChoiceItems: listOfPlaces, listOfChoicesTitle: "Villes")
            }
            
        }
        .padding()
    }
}

#Preview {
    FilterOffersView(selectedContracts: .constant([]), selectedCompanies: .constant([]), selectedPlaces: .constant([]))
}
