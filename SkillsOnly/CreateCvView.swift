import SwiftUI

struct CreateCvView: View {
    @State private var jobTitle: String = ""
    @State private var tel: String = ""
    @State private var address: String = ""
    @State private var city: String = ""
    @State private var descrip: String = ""
    @State private var image: String = ""
    @State private var experiences: [Experience] = []
    @State private var skills: [Skills] = []
    @State private var educations: [Education] = []
    
    // Champs pour ajouter une expérience
    @State private var expName: String = ""
    @State private var expStart: String = ""
    @State private var expEnd: String = ""
    @State private var expDesc: String = ""
    
    // Champs pour ajouter une compétence
    @State private var skillName: String = ""
    @State private var skillLevel: Int = 1
    let onColor = Color("Mygreen")
    let offColor = Color.gray
    
    // Champs pour ajouter une formation
    @State private var eduName: String = ""
    @State private var eduStart: String = ""
    @State private var eduEnd: String = ""
    @State private var eduDesc: String = ""
    
    @State private var date: String = ""
    
    @State private var confirmModal: Bool = false
    
    func addExp() {
        let newExp = Experience(name: expName, datesBegin: expStart, dateEnd: expEnd, description: expDesc)
        experiences.append(newExp)
        expName = ""
        expStart = ""
        expEnd = ""
        expDesc = ""
    }
    func removeExp(at index: Int) {
        experiences.remove(at: index)
    }
    func addSkill() {
        let newSkill = Skills(name: skillName, level: skillLevel)
        skills.append(newSkill)
        skillName = ""
        skillLevel = 1
    }
    func removeSkill(at index: Int) {
        skills.remove(at: index)
    }
    
    func addEduc() {
        let newEdu = Education(name: eduName, datesBegin: eduStart, dateEnd: eduEnd, description: eduDesc)
        educations.append(newEdu)
        eduName = ""
        eduStart = ""
        eduEnd = ""
        eduDesc = ""
    }
    func removeEduc(at index: Int) {
        educations.remove(at: index)
    }
    
    func saveResume() {
        let newResume = Resume(
            jobTitle: jobTitle,
            experience: experiences,
            descrip: descrip.isEmpty ? "Aucune description fournie." : descrip,
            image: image.isEmpty ? "Logo" : image,
            tags: [],
            city: city.isEmpty ? "Ville non spécifiée" : city,
            skills: skills,
            education: educations,
            tel: tel,
            address: address,
            date: date.isEmpty ? "Aujourd’hui" : date
        )
        
        print("CV ajouté : \(newResume)")
        confirmModal = true
    }
    
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Group {
                        CustomTextField(placeholder: "Nom du poste", text: $jobTitle)
                        CustomTextField(placeholder: "Tel", text: $tel)
                        CustomTextField(placeholder: "Adresse", text: $address)
                        CustomTextField(placeholder: "Ville", text: $city)
                    }
                    
                    Group {
                        Text("Description personnelle")
                        TextEditor(text: $descrip)
                            .frame(height: 80)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color("Mygreen"), lineWidth: 1))
                    }
                    .padding(.horizontal)
                    
                    Group {
                        Text("Image")
                        Text("(Exemple: l'icône correspondant au poste recherché)")
                        CustomTextField(placeholder: "Lien de l'image", text: $image)
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Expériences")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        CustomTextField(placeholder: "Nom de l'expérience", text: $expName)
                        CustomTextField(placeholder: "Date de début", text: $expStart)
                        CustomTextField(placeholder: "Date de fin", text: $expEnd)
                        Text("Description de l'expérience").padding(.horizontal)
                        TextEditor(text: $expDesc)
                            .frame(height: 80)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color("Mygreen"), lineWidth: 1))
                            .padding(.horizontal)
                        
                        Button(action: addExp) {
                            Label("Ajouter", systemImage: "plus.circle.fill")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("Mygreen"))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                    }
                    // VStack qui affiche les compétences saisies
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(Array(experiences.enumerated()), id: \.element.name) { index, exp in
                            VStack(alignment: .leading) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(exp.name).font(.headline)
                                        Text("De: \(exp.datesBegin) à: \(exp.dateEnd)").font(.subheadline)
                                        Text(exp.description).font(.body)
                                    }
                                    Spacer()
                                    Button(action: {
                                        removeExp(at: index) // Supprime l'exp
                                    }) {
                                        Image(systemName: "minus.circle.fill")
                                            .foregroundColor(Color("Mygreen"))
                                            .font(.title2)
                                    }
                                }
                            }
                            .padding()
                            .background(Color("cardGreen"))
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity) //  Pprend toute la largeur
                            .padding(.horizontal)
                        }
                    }
                    .frame(maxWidth: .infinity) //  prend toute la largeur
                    
                    VStack(alignment: .leading) {
                        Text("Compétences").font(.headline).padding(.horizontal)
                        CustomTextField(placeholder: "Nom de la compétence", text: $skillName)
                        Stepper("Niveau : \(skillLevel)", value: $skillLevel, in: 1...5).padding(.horizontal)
                        
                        Button(action: addSkill) {
                            Label("Ajouter", systemImage: "plus.circle.fill")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("Mygreen"))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                    }
                    //affichage des compétenecs saisies
                    
                    ForEach(Array(skills.enumerated()), id: \.element.name) { index, skill in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(skill.name).font(.headline)
                                Spacer()
                                
                                // Affichage des étoiles selon le niveau
                                ForEach(1...5, id: \.self) { number in
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(number > skill.level ? offColor : onColor)
                                }
                                
                                // Supprime la compétence spécifique
                                Button(action: {
                                    removeSkill(at: index)
                                }) {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundColor(Color("Mygreen"))
                                        .font(.title2)
                                }
                            }
                        }
                        .padding()
                        .background(Color("cardGreen"))
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity) // occupe toute la largeur
                        .padding(.horizontal)
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("Formations").font(.headline).padding(.horizontal)
                        CustomTextField(placeholder: "Nom de la formation", text: $eduName)
                        CustomTextField(placeholder: "Date de début", text: $eduStart)
                        CustomTextField(placeholder: "Date de fin", text: $eduEnd)
                        Text("Descriptif").padding(.horizontal)
                        TextEditor(text: $eduDesc)
                            .frame(height: 80)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color("Mygreen"), lineWidth: 1))
                            .padding(.horizontal)
                        //affichage des formations saisies
                        ForEach(Array(educations.enumerated()), id: \.element.name) { index, educ in
                            VStack(alignment: .leading) {
                                HStack {
                                    VStack(alignment: .leading) { // Contenu à gauche
                                        Text(educ.name).font(.headline)
                                        Text("De: \(educ.datesBegin) à \(educ.dateEnd)").font(.subheadline)
                                        Text(educ.description).font(.body)
                                    }
                                    Spacer() // pousse l'icône à droite
                                    Button(action: {
                                        removeEduc(at: index) // Supprime la formation spécifique
                                    }) {
                                        Image(systemName: "minus.circle.fill")
                                            .foregroundColor(Color("Mygreen"))
                                            .font(.title2)
                                    }
                                }
                            }
                            .padding()
                            .background(Color("cardGreen"))
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity) // VStack sur toute la largeur
                            .padding(.horizontal)
                        }
                        
                        Button(action: addEduc) {
                            Label("Ajouter formation", systemImage: "plus.circle.fill")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("Mygreen"))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
                    }
                    CustomTextField(placeholder: "Date d'ajout", text: $date)
                    Button(action: saveResume) {
                        Text("Enregistrer CV")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("OurGreen"))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                }
                .navigationTitle("CV")
                .padding()
            }
            .sheet(isPresented: $confirmModal) {
                CvConfirm()
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

#Preview(body: {
    CreateCvView()
})
#Preview {
    CvConfirm()
}
struct CvConfirm: View {
    let logo: String = "Logo"
    @Environment(\.dismiss) var dismissModal
    
    var body: some View {
        VStack {
            HStack {
                Spacer() // Pousse le bouton à droite
                Button(action: {
                    dismissModal() // Ferme le modal
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                }
                .padding()
            }
        }
        Spacer()
        VStack {
            Image(logo)
                .resizable()
                .frame(width: 200, height: 80)
                .padding(.bottom, 50)
            Text("Votre CV a été publié ✅")
        }
        Spacer()
        
    }
}
