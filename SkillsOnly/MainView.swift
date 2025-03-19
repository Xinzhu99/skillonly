//
//  MainView.swift
//  SkillsOnly
//
//  Created by Apprenant 132 on 04/03/2025.
//

import SwiftUI

struct MainView: View {
    
    @Binding var myUserType: userTypeEnum
    @Binding var isLoggedIn: Bool
    @Binding var loggedUser: String
    @State private var loggedTalent: Talent = talentEmpty
    @State private var loggedEmployer: Employer = employerEmpty
    
    @State private var selectedItem = 1
    @State private var mustPresentLogin: Bool = false
    
    var body: some View {
        
        TabView(selection: $selectedItem) {
            switch myUserType {
            case .talent:
                
                Tab("Offers list", systemImage: "suitcase", value: 1) {
                    OffersListView(isLoggedIn: $isLoggedIn, myUserType: $myUserType, loggedUser: $loggedUser, loggedTalent: $loggedTalent, loggedEmployer: $loggedEmployer)
                }
                
            case .employer:
                
                Tab("Resumes list", systemImage: "magnifyingglass", value: 1){
                    ResumesListView(isLoggedIn: $isLoggedIn, myUserType: $myUserType, loggedUser: $loggedUser, loggedTalent: $loggedTalent, loggedEmployer: $loggedEmployer)
                }
            case .nilUser:
                // This case should never happen
                
                Tab("No user type", systemImage: "circle", value: 1){
                    Text("Hello, new user!")
                }
            }
            
            switch myUserType {
            case .talent:
                Tab("Candidatures", systemImage: "paperplane", value: 2){
                TalentApplicationView(isLoggedIn: $isLoggedIn, talent: loggedTalent)
                    }
                    
                
                
            case .employer:
                Tab("Mes offres", systemImage: "paperplane", value: 2){
                    EmployerDashboardView(isLoggedIn: $isLoggedIn, employer: loggedEmployer)

                    }
                
            case .nilUser:
                // This case should never happen
                
                Tab("No user type", systemImage: "circle", value: 2){
                    Text("Hello, new user!")
                    }
            }
            

            
            switch myUserType {
            case .talent:
                
                Tab("Create CV", systemImage: "text.document", value: 3){
                    CreateCvView()
                    }

            case .employer:
                Tab("Create offer", systemImage: "folder", value: 3){
                    CreateOfferView()
                    }
                    
            case .nilUser:
                // This case should never happen
                Tab("No user type", systemImage: "circle", value: 3){
                    Text("Hello, new user!")

                    }
            }
        }
        .onChange(of: selectedItem) {
            mustPresentLogin = isLoggedIn.inverted && selectedItem != 1
        }
        .sheet(isPresented: $mustPresentLogin) {
           LogIn(isLoggedIn: $isLoggedIn, myUserType: $myUserType, loggedUser: $loggedUser, loggedTalent: $loggedTalent, loggedEmployer: $loggedEmployer)
                    .interactiveDismissDisabled()
            
        }
        .onAppear(){
            getUserFromId(id: loggedUser)
        }
    }
    
    func getUserFromId(id: String) {
        switch myUserType {
        case .talent:
            for talent in listTalent {
                if talent.id == id {
                    loggedTalent = talent
                    return
                }
            }
        case .employer:
            for employer in listEmployer {
                if employer.id == id {
                    loggedEmployer = employer
                    return
                }
            }
        case .nilUser:
            break
        }
    }
}



extension Bool {
    var inverted: Self {
        get { !self }
        set { self = !newValue }
    }
}

#Preview {
    MainView(myUserType: .constant(.talent), isLoggedIn: .constant(true), loggedUser: .constant("employerMock1"))
}

