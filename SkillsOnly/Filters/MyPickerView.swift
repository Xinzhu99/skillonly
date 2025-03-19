//
//  MyPickerViewK.swift
//  SkillsOnly
//
//  Created by Apprenant 132 on 05/03/2025.
//

import SwiftUI

struct MyPickerView: View {
    
    @State private var isExpanded = false
    
    @State private var someSelected : Bool = false
    @Binding var listOfSelectedItems: Set<String>
    
    let listOfChoiceItems : [String]
    let listOfChoicesTitle : String
    // couleurs spécifiques pour chaque bouton
        private var nonSelectedColor: Color {
            switch listOfChoicesTitle {
            case "Villes":
                return Color("lighterGreen").opacity(0.7)
            case "Compétences":
                return Color("lightGreen") .opacity(0.7)
            case "Postes", "Contrats":
                return Color("mediumGreen") .opacity(0.7)
            default:
                return Color("lighterGreen") // Valeur par défaut
            }
        }
    var body: some View {
            HStack {
                Button {
                    isExpanded.toggle()
                }
                label: {
                    HStack {
                        Text(listOfChoicesTitle)
                            .font(.body)
                            .fontWeight(someSelected ? .bold : .regular)
                            .foregroundColor(someSelected ? .white : .black)
                        if someSelected {
                            Image(systemName: "checkmark")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 8)
                    .background(someSelected ? Color("maxiGreen") : nonSelectedColor) // Applique la couleur selon la catégorie
                    .clipShape(Capsule())
                }
                .buttonStyle(.plain)
                .sheet(isPresented: $isExpanded) {
                    ListChoiceView(listOfChoices: listOfChoiceItems, selectedItems: $listOfSelectedItems, someSelected: $someSelected)
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                }
            }
        }
    }

struct MyPickerView_Previews: PreviewProvider {
    static var previews: some View {
        MyPickerView(listOfSelectedItems: .constant([]), listOfChoiceItems: listOfContracts, listOfChoicesTitle: "Contract")
    }
}
