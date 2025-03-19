//
//  ListChoiceView.swift
//  SkillsOnly
//
//  Created by Apprenant 132 on 06/03/2025.
//

import SwiftUI

struct ListChoiceView: View {
    
    
    var listOfChoices: [String]
    @Binding var selectedItems: Set<String>
    @Binding var someSelected : Bool
    @Environment(\.dismiss) var dismissModal
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button {
                    dismissModal()
                }
                label: {
                    Text("OK")
                }
                .padding()
            }
            
            
            List(listOfChoices, id: \.self) { item in
                Button {
                    if selectedItems.contains(item) {
                        selectedItems.remove(item)
                        if selectedItems.isEmpty {
                            someSelected = false
                        }
                    } else {
                        selectedItems.insert(item)
                        someSelected = true
                    }
                    
                } label: {
                    HStack {
                        if selectedItems.contains(item) {
                            Image(systemName: "checkmark")
                                .foregroundColor(Color("OurGreen"))
                            Text(item)
                                .foregroundStyle(Color("OurGreen"))
                                .frame(alignment: .leading)
                        }
                        else {
                            Text(item)
                                .frame(alignment: .leading)
                        }
                    }
                }
                .foregroundStyle(.black)
                .listRowBackground(Color("OurLightGreen"))
            }
            .scrollContentBackground(.hidden)
        }
        
    }
}

#Preview {
    ListChoiceView(listOfChoices: listOfPlaces, selectedItems: .constant(Set<String>()), someSelected: .constant(false))
}
