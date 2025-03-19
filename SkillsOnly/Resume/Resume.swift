//
//  Candidate.swift
//  SkillsOnly
//
//  Created by Apprenant 134 on 07/03/2025.
//

import Foundation

struct Resume: Identifiable, Hashable {
    var id = UUID()
    var jobTitle : String
    var experience : [Experience]
    var descrip : String
    var image : String
    var tags : [String]
    var city : String
    var skills :[Skills]
    var education : [Education]
    var tel : String
    var address : String
    var date : String
}

struct Skills: Identifiable, Hashable {
    var id = UUID()
    var name : String
    var level : Int
}
struct Experience: Identifiable, Hashable {
    var id = UUID()
    var name : String
    var datesBegin : String
    var dateEnd : String
    var description : String
}
struct Education: Identifiable, Hashable {
    var id = UUID()
    var name : String
    var datesBegin : String
    var dateEnd : String
    var description : String
}
