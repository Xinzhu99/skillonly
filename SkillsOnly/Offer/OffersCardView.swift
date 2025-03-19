//
//  OffersCardView.swift
//  SkillsOnly
//
//  Created by Apprenant 132 on 14/03/2025.
//

import SwiftUI

struct OffersCardView: View {
    let offer: Offers
    @State private var isFavorite: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                // Image de l'offre
                    Image(systemName: offer.image)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.black)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())

                VStack(alignment: .leading) {
                    Text(offer.jobTitle)
                        .font(.headline)
                        .foregroundStyle(.black)
                    Text("\(offer.company)")
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
            
            Text(offer.description)
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
    OffersCardView(offer: offerMock1)
}
