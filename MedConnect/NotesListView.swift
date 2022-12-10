//
//  NotesListView.swift
//  MedConnect
//
//  Created by Jack Hurley on 12/9/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct NotesListView: View {
    @State var notes: Notes
    @State var patient: Patient
    
    @FirestoreQuery(collectionPath: "patients") var patients: [Patient]
    @FirestoreQuery(collectionPath: "patients") var doctorNotes: [Notes]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List(doctorNotes) { notes in
                NavigationLink {
                    DoctorNotesView(patient: Patient(), notes: notes)
                } label: {
                    Text(notes.title)
                        .font(.title2)
                }
            }
            
            .listStyle(.plain)
            .navigationTitle("Patients")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Sign Out"){
                        do {
                            try Auth.auth().signOut()
                            print("Logout successful")
                            dismiss()
                        } catch {
                            print("ERROR: Could not sign out.")
                        }
                    }
                }
            }
        }
        .onAppear{
            $doctorNotes.path = "patients/\(patient.id ?? "")/notes"
        }
        
    }
}

struct NotesListView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView(notes: Notes(), patient: Patient())
    }
}
