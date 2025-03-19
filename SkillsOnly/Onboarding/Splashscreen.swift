//
//  SwiftUIView.swift
//  SkillsOnly
//
//  Created by Apprenant 134 on 04/03/2025.
//

import SwiftUI

struct Splashscreen: View {
    
    let logo:String = "Logo"
    let background:String = "background"
    @Binding var showSecondScreen: Bool
    
    //body
    var body: some View {
        ZStack{
            Image(background)
                .resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            
            VStack{
                Image(logo)
                    .resizable()
                    .frame(width: 200,height: 80)
                    .padding(.bottom,100)
                
                    VStack{
                        Text("Tous différents,")
                            .font(.largeTitle)
                            .foregroundStyle(Color.white)
                        Text("Tous égaux")
                            .font(.largeTitle)
                            .foregroundStyle(Color.white)
                    }
                    .frame(width: 320)
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(12)
                    .padding(.bottom, 20)
                    //fin de mon VStack 2 lignes de slogan
                    
                
            }//fin de mon VStack
        }
        .onAppear {
            // Attendre 5 secondes et passer à l'écran suivant
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                showSecondScreen = true
            }
        }
        
    }//fin de mon body
}

#Preview {
    Splashscreen(showSecondScreen: .constant(false))
}
