//
//  LogIn.swift
//  SkillsOnly
//
//  Created by Apprenant 134 on 13/03/2025.
//

import SwiftUI
struct LogIn: View {
    let logo : String = "Logo"
    
    @State private var userName = ""
    @State private var mdp = ""
    @Binding var isLoggedIn : Bool
    @Binding var myUserType: userTypeEnum
    @Environment(\.dismiss) var dismissLoginModal
    @Binding var loggedUser: String
    @State var pressedLogin: Bool = false
    @Binding var loggedTalent: Talent
    @Binding var loggedEmployer: Employer
    
    func getUserFromId(id: String) {
        switch myUserType {
        case .talent:
            for talent in listTalent {
                if talent.id == id {
                    loggedTalent = talent
                    
                }
            }
        case .employer:
            for employer in listEmployer {
                if employer.id == id {
                    loggedEmployer = employer
                }
            }
        case .nilUser:
            break
        }
    }
    
    func login(usersTalent: [Talent], usersEmployer: [Employer], email: String, password: String) {
        // Check if user exists in list of talents
        switch myUserType {
        case .talent:
            for userTalent in usersTalent {
                if userTalent.email == email && userTalent.password == password {
                    loggedUser = userTalent.id
                    isLoggedIn = true
                    getUserFromId(id: loggedUser)
                }
            }
        case .employer:
            // Check if user exists in list of employers
            for userEmployer in usersEmployer {
                if userEmployer.email == email && userEmployer.password == password {
                    loggedUser = userEmployer.id
                    isLoggedIn = true
                    getUserFromId(id: loggedUser)
                }
            }
        case .nilUser:
            break
        }
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Button{
#if DEBUG
                    if myUserType == .employer{
                        userName = "recruteur1@techcorp.com"
                        mdp = "password123"
                    } else if myUserType == .talent{
                        userName = "jojo.milesi@icloud.com"
                        mdp = "mysecuredpassword"
                    } else {
                        userName = ""
                        mdp = ""
                    }
#endif
                }label:{
                    Image(logo)
                        .resizable()
                        .frame(width: 200,height: 80)
                        .padding(.bottom,100)
                }
//                Image(logo)
//                    .resizable()
//                    .frame(width: 200,height: 80)
//                    .padding(.bottom,100)
                Text("Se Connecter")
                    .font(.system(size:55, weight:.bold))
                HStack{
                    Image(systemName: "envelope")
                        .foregroundStyle(Color("Mygreen"))
                        .frame(width: 30, height: 30)
                    TextField("Entrer votre adresse mail",text:$userName)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                }//fin de HStack email
                .padding()
                
                HStack{
                    Image(systemName: "key")
                        .foregroundStyle(Color("Mygreen"))
                        .frame(width: 30, height: 30)
                    SecureField("Entrer votre mot de passe", text: $mdp)
                        .textFieldStyle(.roundedBorder)
                    
                }//fin de HStack mdp
                .padding()
                if pressedLogin && !isLoggedIn {
                    Text("Wrong email or password")
                        .foregroundStyle(.red)
                }
                Button{
                    pressedLogin = true
                    login(usersTalent: listTalent, usersEmployer: listEmployer, email: userName, password: mdp)
                    if isLoggedIn {
                        dismissLoginModal()
                    }
                }label:{
                    Text("Log In")
                    
                }
                .frame(width: 140, height: 30) // Taille uniforme
                .padding()
                .background(Color("Mygreen"))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
                HStack{
                    Text("Vous n’avez pas de compte,")
                    NavigationLink{
                        CreateAccount()
                        
                    }label:{
                        Text("inscrivez-vous.")
                            .foregroundStyle(Color("OurGreen"))
                    }
                }
            }
        }
    }
}

#Preview {
    LogIn(isLoggedIn: .constant(false), myUserType: .constant(.talent), loggedUser: .constant(""), loggedTalent: .constant(talentMock1), loggedEmployer: .constant(employerMock1))
}
