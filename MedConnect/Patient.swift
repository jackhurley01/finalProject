//
//  Patient.swift
//  MedConnect
//
//  Created by Jack Hurley on 12/8/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Patient: Identifiable, Codable {
    
//    enum States: String, CaseIterable, Codable {
//        case AK, AL, AR, AS, AZ, CA, CO, CT, DC, DE, FL, GA, GU, HI, IA, ID, IL, IN, KS, KY, LA, MA, MD, ME, MI, MN, MO, MP, MS, MT, NC, ND, NE, NH, NJ, NM, NV, NY, OH, OK, OR, PA, PR, RI, SC, SD, TN, TX, UM, UT, VA, VI, VT, WA, WI, WV, WY
//    }
//
//    enum YesOrNo: String, CaseIterable, Codable {
//        case Yes, No
//    }
    
    //Personal Info
    @DocumentID var id: String?
    var name = ""
    var address = ""
    var city = ""
    var state = ""
    var SSNumber = ""
    var zip = ""
    var mobile = ""
    var home = ""
    var email = ""
    
    //Insurance Info
    var insuranceType = ""
    var insuredName = ""
    var relationship = ""
    var employer = ""
    var insuranceNumber = ""
    
    //Medical Information
    var medications = ""
    var allergies = ""
    var medicalConditions = ""
    var surgeries = ""
    var vaccine = ""
    var covid = ""
    
    
    var dictionary: [String: Any] {
        return ["name": name, "address": address, "city": city, "state" : state, "SSNumber": SSNumber, "ZIP" : zip, "mobile":mobile, "home":home, "email":email, "insuranceType" : insuranceType, "insuredName":insuredName, "relationship":relationship, "employer":employer, "insuranceNumber":insuranceNumber, "medications":medications, "allergies":allergies, "medicalConditions":medicalConditions, "surgeries":surgeries, "vaccine":vaccine, "covid":covid]
    }
}
