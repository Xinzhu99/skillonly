//
//  CreateAccount.swift
//  SkillsOnly
//
//  Created by Apprenant 134 on 13/03/2025.
//

import SwiftUI
struct CreateAccount: View {
    let logo : String = "Logo"
    
    @State private var userName = ""
    @State private var mdp = ""
    @State private var mdpCheck = ""
    @Environment(\.dismiss) var dismissModal
    @State var pressedSignup: Bool = false
    
    func accountExists(users: [Talent], email: String, password : String) -> Bool  {
        for user in users {
            if user.email != email  && mdp == mdpCheck {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        VStack{
            Image(logo)
                .resizable()
                .frame(width: 200,height: 80)
                .padding(.bottom,100)
            Text("Créer votre compte")
                .font(.system(size:55, weight:.bold))
            HStack{
                Image(systemName: "envelope")
                    .foregroundStyle(Color("Mygreen"))
                    .frame(width: 30, height: 30)

                TextField("Entrer votre adresse mail",text:$userName)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
            }//fin de HStack email
            
            HStack{
                Image(systemName: "key")
                    .foregroundStyle(Color("Mygreen"))
                    .frame(width: 30, height: 30)
                SecureField("Entrer votre mot de passe", text: $mdp)
                    .textFieldStyle(.roundedBorder)
            }//fin de HStack mdp
            HStack{
                Image(systemName: "key")
                    .foregroundStyle(Color("Mygreen"))
                    .frame(width: 30, height: 30)

                SecureField("Confirmer votre mot de passe", text: $mdpCheck)
                    .textFieldStyle(.roundedBorder)
                
            }//fin de HStack mdp vérification
            
            if pressedSignup {
                Text("Erreur")
                    .foregroundStyle(.red)
            }
            Button{
                
                if accountExists(users: listTalent, email: userName, password: mdp) {
                    pressedSignup = true
                    // display message account already exists
                } else {
                    //func to create acount
                    dismissModal()
                }
            }label:{
                Text("S'inscrire")
                
            }
            .frame(width: 140, height: 30) // Taille uniforme
            .padding()
            .background(Color("Mygreen"))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }.padding()
    }
}

#Preview {
    CreateAccount()
}
