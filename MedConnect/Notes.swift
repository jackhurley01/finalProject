//
//  Notes.swift
//  MedConnect
//
//  Created by Jack Hurley on 12/9/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Notes: Identifiable, Codable{
    @DocumentID var id: String?
    var title = ""
    var body = ""
    var doctor = ""
    var profession = ""
    var location = ""
    var postedOn = Date()
    
    var dictionary: [String: Any]{
        return ["title":title, "body" : body, "doctor": Auth.auth().currentUser?.email ?? "","profession":profession,"location":location, "postedOn" : Timestamp(date: Date())]
    }
    
}
