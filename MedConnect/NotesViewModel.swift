//
//  NotesViewModel.swift
//  MedConnect
//
//  Created by Jack Hurley on 12/9/22.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

class NoteViewModel: ObservableObject {
    @Published var note = Notes()
    
    func saveNote(patient: Patient, note: Notes) async -> Bool {
        let db = Firestore.firestore()
        
        let collectionString = "patient/\(patient.id ?? "")/notes"
        
        if let id = patient.id {
            do {
                try await db.collection(collectionString).document(id).setData(note.dictionary)
                print("Data updated successfully")
                return true
            } catch {
                print("ERROR: Could not save note in 'notes' \(error.localizedDescription)")
                return false
            }
        } else {
            do {
                _ = try await db.collection(collectionString).addDocument(data: note.dictionary)
                print("Data added successfully")
                return true
            } catch {
                print("ERROR: could not create a new note in 'notes' \(error.localizedDescription)")
                return false
            }
        }
    }
}
