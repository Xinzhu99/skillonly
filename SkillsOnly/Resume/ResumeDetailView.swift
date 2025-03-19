//
//  TalentDetailView.swift
//  skillsOnly
//
//  Created by Apprenant174 on 11/03/2025.
//

import SwiftUI

struct ResumeDetailView: View {
    var resume: Resume //déclarer une variable pour reprendre les éléments de la structure Resume
    
    // pour installer le star rating:
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.mygreen
    
    @Binding var isLoggedIn: Bool // Vérifier si l'utilisateur est connecté
    
    func image(for number: Int, toto: Int) -> Image {
        
        
        if number > toto {
            offImage ?? onImage
        } else {
            onImage
        }
    }
    //variables Bool pour affichier le pop up et ajouter au favoris
    @State private var isShowingModal : Bool = false
    @State private var isFavorite : Bool = false
    //body
    var body: some View {
        
        NavigationStack{//bizarre mais ça marche
            ScrollView {
                VStack {
                    Image(systemName: resume.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding()
                    
                    Text(resume.jobTitle)
                        .font(.title)
                        .bold()
                    
                    Text("📍 \(resume.city)")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Text(resume.descrip)
                    //                .padding()
                    
                    Text("Compétences")
                        .font(.title)
                        .bold()
                    //ci dessous la liste de compétences
                    
                    ForEach(resume.skills) { skill in
                        HStack{
                            Text(skill.name)
                            Spacer()
                            Text("Niveau :")
                            
                            ForEach(1..<5 + 1, id: \.self) { number in
                                image(for: 5, toto: skill.level)
                                    .foregroundStyle(number > skill.level ? offColor : onColor)
                            }
                            
                        }
                        Divider()//pour ajouter une ligne en bas de chaque élément de la boucle
                    }
                    //ci-dessous la partie Experience
                    Text("Expériences")
                        .font(.title)
                        .bold()
                    ForEach(resume.experience) { banane in
                        
                        VStack{
                            Text(banane.name)
                                .bold()
                            HStack{
                                Text(banane.datesBegin)
                                Text("---")
                                Text(banane.dateEnd)
                            }.bold()
                            Text(banane.description)
                        }
                        
                        
                    }
                    //       .navigationTitle("Profil de \(resume.jobTitle)")
                    
                    //ci dessous la partie Education
                    Text("Education")
                        .font(.title)
                        .bold()
                    ForEach(resume.education) { banane in
                        
                        VStack{
                            Text(banane.name)
                                .bold()
                            HStack{
                                Text(banane.datesBegin)
                                Text("---")
                                Text(banane.dateEnd)
                            }.bold()
                            Text(banane.description)
                        }
                    }
                }.padding()
                
                
            }
            VStack(alignment: .center) {
                
                if isLoggedIn {
                    //ci dessous le bouton pour afficher un modal
                    Button{
                        isShowingModal.toggle()
                    }label:{
                        Text("Contacter")
                        
                    }
                    .accessibilityIdentifier("ContacterButton")
                    .frame(width: 140, height: 30) // Taille uniforme
                    .padding()
                    .background(Color("Mygreen"))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .sheet(isPresented: $isShowingModal){
                        ContactConfirm()
                            .presentationDetents([.medium, .large])
                    }
                } else {
                    Text("Connectez vous pour contacter")
                }
            }
            .padding()
            .toolbar {
                Button{
                    isFavorite.toggle()
                }label:{
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(Color.mygreen)
                }
            }
        }
    }
}
#Preview {
    ResumeDetailView(resume: resumesList[0], isLoggedIn: .constant(true))
}
