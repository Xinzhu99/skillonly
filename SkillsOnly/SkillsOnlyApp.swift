//
//  SkillsOnlyApp.swift
//  SkillsOnly
//
//  Created by Apprenant 132 on 04/03/2025.
//

import SwiftUI


@main
struct SkillsOnlyApp: App {
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("myUserType") var myUserType: userTypeEnum = .nilUser
    @AppStorage("loggedUser") var loggedUser : String = ""
    
    
    init(){
        
        // Only for UI auto tests, if ui testing, App Storage data are reset
        if ProcessInfo.processInfo.arguments.contains("UI-Testing"){
            if let bundleID = Bundle.main.bundleIdentifier {
                UserDefaults.standard.removePersistentDomain(forName: bundleID)
                isLoggedIn = true
            }
        }
    }
    

    
    
    var body: some Scene {
        
        WindowGroup {
            switch myUserType {
            case .talent:
                //display talent view
                MainView(myUserType: $myUserType, isLoggedIn: $isLoggedIn, loggedUser: $loggedUser)
            case .employer:
                //display employer view
                MainView(myUserType: $myUserType, isLoggedIn: $isLoggedIn, loggedUser: $loggedUser)
            case .nilUser:
                OnboardingFlowView(myUserType: $myUserType) // Affichage des écrans d'onboarding
            }
        }
    }
}
