//
//  DoctorDetailView.swift
//  MedConnect
//
//  Created by Jack Hurley on 12/8/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct DoctorDetailView: View {
    @FirestoreQuery(collectionPath: "patient") var patients: [Patient]
    @State private var sheetIsPresented = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        
        NavigationStack {
            
            List(patients) { patient in
                NavigationLink {
                    PatientDetailView(patient: patient)
                } label: {
                    Text(patient.name)
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
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    PatientDetailView(patient: Patient())
                }
            }
        }
    }
}


struct DoctorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            DoctorDetailView()
        }
    }
}
