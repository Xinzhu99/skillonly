//
//  ApplicationConfirm.swift
//  SkillsOnly
//
//  Created by Apprenant 134 on 13/03/2025.
//
import SwiftUI

struct ApplicationConfirm: View {
    let logo:String = "Logo"

    var body: some View {

            VStack{
                Image(logo)
                  .resizable()
                  .frame(width: 200,height: 80)
                  .padding(.bottom,50)
                Text("Votre candidature a été envoyée 📤 !" )
                    .accessibilityIdentifier("CandidatureSent")
            }
        }
}

#Preview {
    ApplicationConfirm()
}
