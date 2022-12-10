//
//  PatientViewModel.swift
//  MedConnect
//
//  Created by Jack Hurley on 12/8/22.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

class PatientViewModel: ObservableObject {
    @Published var patient = Patient()
    
    func savePatient(patient: Patient) async -> Bool {
        let db = Firestore.firestore()
        
        if let id = patient.id {
            do {
                try await db.collection("patient").document(id).setData(patient.dictionary)
                print("Data updated successfully")
                return true
            } catch {
                print("ERROR: Could not save patient data in 'patients' \(error.localizedDescription)")
                return false
            }
        } else {
            do {
                _ = try await db.collection("patient").addDocument(data: patient.dictionary)
                print("Data added successfully")
                return true
            } catch {
                print("ERROR: could not create a new patient in 'patients' \(error.localizedDescription)")
                return false
            }
        }
    }
}

