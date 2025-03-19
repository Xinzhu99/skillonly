//
//  OnboardingFlowView.swift
//  SkillsOnly
//
//  Created by Apprenant 132 on 11/03/2025.
//

import SwiftUI

struct OnboardingFlowView: View {
    @State private var showSecondScreen = false
    @Binding var myUserType : userTypeEnum
    
    var body: some View {
        VStack {
            if !showSecondScreen {
                Splashscreen(showSecondScreen: $showSecondScreen)
            } else {
                Onboarding(myUserType: $myUserType)
            }
        }
        .transition(.slide)
    }
}

#Preview {
    OnboardingFlowView(myUserType: .constant(.nilUser))
}
