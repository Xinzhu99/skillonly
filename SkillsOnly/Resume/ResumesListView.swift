//
//  ResumesView.swift
//  SkillsOnly
//
//  Created by Apprenant 132 on 04/03/2025.
//

import SwiftUI

struct ResumesListView: View {
    
    @State private var searchText = ""
    @Binding var isLoggedIn: Bool
    @Binding var myUserType: userTypeEnum
    @Binding var loggedUser: String
    @Binding var loggedTalent: Talent
    @Binding var loggedEmployer: Employer
    
    @State private var selectedPlaces: Set<String> = []
    @State private var selectedSkills: Set<String> = []
    @State private var selectedJobs: Set<String> = []
    
    @State private var isPresentedLogin: Bool = false

    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                FilterResumesView(selectedPlaces: $selectedPlaces, selectedSkills: $selectedSkills, selectedJobs: $selectedJobs)
                
                VStack(){
                    ForEach(filterResults) { resume in
                        NavigationLink{
                            //children pages
                            ResumeDetailView(resume: resume, isLoggedIn: $isLoggedIn)
                            
                        }
                        label: {
                            ResumeCardView(resume: resume)
                                .multilineTextAlignment(.leading)
                        }
                        .accessibilityIdentifier(resume.jobTitle)
                    }
                }
                .searchable(text: $searchText, prompt: "Recherche")
                .navigationTitle("Resumes")
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
    
    
    var filteredResultsByPlaces: [Resume] {
        if selectedPlaces.isEmpty {
            return resumesList
        } else {
            return resumesList.filter {
                selectedPlaces.contains($0.city)
            }
        }
    }
    
    var filteredResultsByJobs: [Resume] {
        if selectedJobs.isEmpty {
            return resumesList
        } else {
            return resumesList.filter {
                selectedJobs.contains($0.jobTitle)
            }
        }
    }
    
    var filteredResultsBySkills: [Resume] {
        if selectedSkills.isEmpty {
            return resumesList
        }
        else {
            return resumesList.filter{
                selectedSkills.contains(where: $0.skills.map(\.name).contains)
            }
        }
    }
    
    var searchResults: [Resume] {
        if searchText.isEmpty {
            return resumesList
        } else {
            return resumesList.filter { $0.jobTitle.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var filterResults: [Resume] {
        let searchResultsSet = Set(searchResults)
        let filteredResultsByPlacesSet = Set(filteredResultsByPlaces)
        let filteredResultsByJobsSet = Set(filteredResultsByJobs)
        let filteredResultsBySkillsSet = Set(filteredResultsBySkills)
        
        var intersectionResults = Array(
            searchResultsSet
                .intersection(filteredResultsByPlacesSet)
                .intersection(filteredResultsByJobsSet)
                .intersection(filteredResultsBySkillsSet))
        intersectionResults.sort(by: { $0.date > $1.date })
        
        return intersectionResults
    }
}






#Preview {
    ResumesListView(isLoggedIn: .constant(true), myUserType: .constant(.nilUser), loggedUser: .constant("talentMock1"), loggedTalent: .constant(talentMock1), loggedEmployer: .constant(employerMock1))
}
