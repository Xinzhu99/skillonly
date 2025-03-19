//
//  Offers.swift
//  SkillsOnly
//
//  Created by Apprenant 134 on 07/03/2025.
//

import Foundation
struct Offers : Identifiable, Hashable {
    var id = UUID()
    var company : String
    var image : String
    var jobTitle : String
    var city : String
    var salaryMin : Int
    var salaryMax : Int
    var tags : [String]
    var contractType : String
    var description : String
    var profile : String
    var postedAt: String
    var applications: [Application] // candidatures liées à cette offre
}
