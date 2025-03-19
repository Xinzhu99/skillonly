//
//  ResumeCardView.swift
//  skillsOnly
//
//  Created by Apprenant174 on 10/03/2025.
//

import SwiftUI

// Carte Talent
struct ResumeCardView: View {
    let resume: Resume
    @State private var isFavorite: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                // Image du talent
                Image(systemName: resume.image)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.black)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                VStack(alignment: .leading) {
                    Text(resume.jobTitle)
                        .font(.headline)
                        .foregroundStyle(.black)
                    Text("\(resume.experience.count) années d’expérience")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                        
                }

                Spacer()

                // Icône favori
                Button {
                    isFavorite.toggle()
                } label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(.black)
                }
            }

            Text(resume.descrip)
                .font(.body)
                .foregroundColor(.black)
                .bold()

        }
        .padding()
        .background(Color("cardGreen").opacity(0.5))
        .cornerRadius(12)
        .padding(.horizontal, 10)
    }
}

#Preview {
    ResumeCardView(resume: resumeMock1)
}
