//
//  Onboarding.swift
//  SkillsOnly
//
//  Created by Apprenant 134 on 04/03/2025.
//

import SwiftUI

struct Onboarding: View {
    
    let logo:String = "Logo"
    let background:String = "background"
    @Binding var myUserType : userTypeEnum
    
    //body
    var body: some View {
        ZStack{
            Image(background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack{
                // Logo
                Image(logo)
                    .resizable()
                    .frame(width: 200,height: 80)
                    .padding(.bottom,100)
                
                // Texte d'introduction amélioré
                VStack {
                    Text("L'application qui recrute selon les compétences, pas les informations personnelles !")
                        .font(.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .frame(width: 320)
                .background(Color.black.opacity(0.5))
                .cornerRadius(12)
                .padding(.bottom, 20)
                
                // Texte pour sélectionner le profil
                VStack {
                    Text("Sélectionnez votre profil")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .frame(width: 320)
                .background(Color.black.opacity(0.5))
                .cornerRadius(12)
                .padding(.bottom, 20)
                
                
                HStack{
                    Button{
                        myUserType = .employer
                    }label:{
                        Text("Recruteur")
                    }
                    .frame(width: 140, height: 30) // Taille uniforme
                    .padding()
                    .background(Color("Mygreen"))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .accessibilityIdentifier("buttonRecruteur")
                    
                
                    Button{
                        myUserType = .talent
                    }label:{
                        Text("Talent")
                        
                    }
                    .frame(width: 140, height: 30) // Taille uniforme
                    .padding()
                    .background(Color("Mygreen2"))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .accessibilityIdentifier("buttonTalent")
                    
                    
                }// fin de mon HStack buttons
                
            }//fin de mon VStack
        }
        
    }//fin de mon body
}

#Preview {
    Onboarding(myUserType: .constant(.nilUser))
}
