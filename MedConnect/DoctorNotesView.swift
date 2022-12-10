//
//  DoctorNotesView.swift
//  MedConnect
//
//  Created by Jack Hurley on 12/9/22.
//

import SwiftUI

struct DoctorNotesView: View {
    @State var patient: Patient
    @State var notes: Notes
    @StateObject var noteVM = NoteViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List{
            Text(patient.name)
                .font(.title2)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.75)
            Text("Doctor Information")
                .bold()
                .font(.title2)
            TextField("Name", text: $notes.doctor)
                .overlay{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                }
            TextField("Profession", text: $notes.profession)
                .overlay{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                }
            TextField("Location (City, State)", text: $notes.location)
                .overlay{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                }
            Text("Visit Information")
                .bold()
                .font(.title2)
            TextField("Reason for Visit", text: $notes.title)
                .overlay{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                }
            TextField("Notes", text: $notes.body, axis: .vertical)
                .padding(.horizontal, 6)
                .frame(maxHeight: .infinity, alignment: .topLeading)
                .overlay{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                }

            
            Spacer()
        }
        .padding(.horizontal)
        .listStyle(.plain)
        .frame(maxWidth: .infinity, alignment: .leading)
        .toolbar{
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel"){
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save"){
                    Task{
                        await noteVM.saveNote(patient: patient, note: notes)
                    }
                    dismiss()
                }
            }
        }
    }
}

struct DoctorNotesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            DoctorNotesView(patient: Patient(name: "John Smith"), notes: Notes())
        }
    }
}
