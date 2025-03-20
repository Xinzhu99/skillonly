//
//  OffersListView.swift
//  SkillsOnly
//
//  Created by Apprenant 132 on 14/03/2025.
//

import SwiftUI

struct OffersListView: View {
    
    @State private var searchText = ""
    @Binding var isLoggedIn: Bool
    @Binding var myUserType: userTypeEnum
    @Binding var loggedUser: String
    @Binding var loggedTalent: Talent
    @Binding var loggedEmployer: Employer
    
    @State private var selectedContracts: Set<String> = []
    @State private var selectedCompanies: Set<String> = []
    @State private var selectedPlaces: Set<String> = []
    
    @State private var isPresentedLogin: Bool = false
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                FilterOffersView(selectedContracts: $selectedContracts, selectedCompanies: $selectedCompanies, selectedPlaces: $selectedPlaces)
                
                VStack(){
                    ForEach(filterResults) { offer in
                        NavigationLink{
                            //children pages
                            OfferDetailView(offer: offer, isLoggedIn: $isLoggedIn)
                            
                        }
                        label: {
                            OffersCardView(offer: offer)
                                .multilineTextAlignment(.leading)
                        }
                        .accessibilityIdentifier(offer.jobTitle)
                    }
                }
                .searchable(text: $searchText, prompt: "Recherche")
                .navigationTitle("Offres")
            }
            .toolbar{
                if isLoggedIn {
                    Button {
                        myUserType = .nilUser
                        isLoggedIn = false
                    }
                    label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("Logout")
                    }
                    .foregroundStyle(.red)
                    .padding()
                } else {
                    Button {
                        isPresentedLogin.toggle()
                        
                    }
                    label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("Login")
                    }
                    .foregroundStyle(Color("OurGreen"))
                    .padding()
                    .sheet(isPresented: $isPresentedLogin){
                        LogIn(isLoggedIn: $isLoggedIn, myUserType: $myUserType, loggedUser: $loggedUser, loggedTalent: $loggedTalent, loggedEmployer: $loggedEmployer)
                            .presentationDragIndicator(.visible)
                    }
                }
            }
        }
    }
    
    
    var filteredResultsByContracts: [Offers] {
        if selectedContracts.isEmpty {
            return offersList
        }
        else {
            return offersList.filter{
                selectedContracts.contains($0.contractType)
            }
        }
    }
    
    var filteredResultsByCompany: [Offers] {
        if selectedCompanies.isEmpty {
            return offersList
        }
        else {
            return offersList.filter{
                selectedCompanies.contains($0.company)
            }
        }
    }
    
    var filteredResultsByPlaces: [Offers] {
        if selectedPlaces.isEmpty {
            return offersList
        } else {
            return offersList.filter {
                selectedPlaces.contains($0.city)
            }
        }
    }
    
    var searchResults: [Offers] {
        if searchText.isEmpty {
            return offersList
        } else {
            return offersList.filter { $0.jobTitle.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var filterResults: [Offers] {
        let searchResultsSet = Set(searchResults)
        let filteredResultsByContractsSet = Set(filteredResultsByContracts)
        let filtetedResultsByCompanySet = Set(filteredResultsByCompany)
        let filteredResultsByPlacesSet = Set(filteredResultsByPlaces)
        
        var intersectionResults = Array(
            searchResultsSet
                .intersection(filteredResultsByContractsSet)
                .intersection(filtetedResultsByCompanySet)
                .intersection(filteredResultsByPlacesSet))
        intersectionResults.sort(by: { $0.postedAt > $1.postedAt })
        
        return intersectionResults
    }
    
}

#Preview {
    OffersListView(isLoggedIn: .constant(true), myUserType: .constant(.nilUser), loggedUser: .constant("talentMock1"), loggedTalent: .constant(talentMock1), loggedEmployer: .constant(employerMock1))
}
