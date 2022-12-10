//
//  PatientDetailView.swift
//  MedConnect
//
//  Created by Jack Hurley on 12/8/22.
//

import SwiftUI
import FirebaseFirestoreSwift

struct PatientDetailView: View {
    @EnvironmentObject var patientVM: PatientViewModel
    @Environment(\.dismiss) private var dismiss
    @State var patient: Patient
//    @State private var medicinePicker: YesOrNo = .No
//    @State private var allergiesPicker: YesOrNo = .No
//    @State private var conditionsPicker: YesOrNo = .No
//    @State private var surgeryPicker: YesOrNo = .No
//
//
//
//
//    enum States: String, CaseIterable, Codable {
//        case AK, AL, AR, AS, AZ, CA, CO, CT, DC, DE, FL, GA, GU, HI, IA, ID, IL, IN, KS, KY, LA, MA, MD, ME, MI, MN, MO, MP, MS, MT, NC, ND, NE, NH, NJ, NM, NV, NY, OH, OK, OR, PA, PR, RI, SC, SD, TN, TX, UM, UT, VA, VI, VT, WA, WI, WV, WY
//    }
//    enum YesOrNo: String, CaseIterable, Codable {
//        case Yes, No
//    }
    
    var body: some View {
        NavigationStack {
            List {
                VStack{
                    Text("Patient Details")
                        .bold()
                        .frame(alignment: .center)
                    HStack{
                        TextField("Name", text: $patient.name)
                            .overlay{
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray.opacity(0.5), lineWidth: 2)
                            }
                        
                        TextField("SS Number", text: $patient.SSNumber)
                            .keyboardType(.numberPad)
                            .overlay{
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray.opacity(0.5), lineWidth: 2)
                            }
                    }
                    
                    TextField("Address", text: $patient.address)
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray.opacity(0.5), lineWidth: 2)
                        }
                    
                    HStack{
                        TextField("City", text: $patient.city)
                            .overlay{
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray.opacity(0.5), lineWidth: 2)
                            }
                        TextField("State", text: $patient.state)
                            .overlay{
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray.opacity(0.5), lineWidth: 2)
                            }
                        TextField("ZIP", text: $patient.zip)
                            .keyboardType(.numberPad)
                            .overlay{
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray.opacity(0.5), lineWidth: 2)
                            }
                    }
                    HStack{
                        TextField("Mobile Phone", text: $patient.mobile)
                            .keyboardType(.numberPad)
                            .overlay{
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray.opacity(0.5), lineWidth: 2)
                            }
                        TextField("Home Phone", text: $patient.home)
                            .keyboardType(.numberPad)
                            .overlay{
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray.opacity(0.5), lineWidth: 2)
                            }
                    }
                    
                    TextField("Email", text: $patient.email)
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray.opacity(0.5), lineWidth: 2)
                        }
                    
                }
                
                VStack{
                    Text("Insurance Details")
                        .bold()
                        .frame(alignment: .center)
                    TextField("Insurance Type", text: $patient.insuranceType)
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray.opacity(0.5), lineWidth: 2)
                        }
                    TextField("Insured's Name", text: $patient.insuredName)
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray.opacity(0.5), lineWidth: 2)
                        }
                    TextField("Relationship", text: $patient.relationship)
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray.opacity(0.5), lineWidth: 2)
                        }
                    TextField("Employer", text: $patient.employer)
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray.opacity(0.5), lineWidth: 2)
                        }
                    TextField("Insurance Number", text: $patient.insuranceNumber)
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray.opacity(0.5), lineWidth: 2)
                        }
                }
                
                Spacer()
                
                VStack {
                    Text("Medical Information")
                        .bold()
                        .frame(alignment: .center)
                    VStack{
                        VStack (alignment: .leading){
                            Text("Are you currently taking any medication?")
                            
                            TextField("List Here", text: $patient.medications)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                                }
                        }
                        
                        VStack (alignment: .leading){
                            Text("Do you have any allergies?")
                            
                            TextField("List Here", text: $patient.allergies)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                                }
                        }
                        
                        VStack (alignment: .leading){
                            Text("Do you have any ongoing medical conditions?")
                            
                            TextField("List Here", text: $patient.medicalConditions)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                                }
                        }
                        
                        VStack (alignment: .leading){
                            Text("Have you had surgery? If yes, please explain procedure and body part with DATES.")
                            
                            TextField("List Here", text: $patient.surgeries)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                                }
                        }
                        VStack (alignment: .leading){
                            Text("Are you fully vaccinated for COVID-19?")
                            TextField("YES/NO", text: $patient.vaccine)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                                }
                            
                            Text("Have you tested positive for COVID-19?")
                            TextField("YES/NO", text: $patient.covid)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                                }
                            
                        }
                    }
                    Spacer()
//                    NavigationLink ("Notes"){
//                        NotesListView(notes: Notes(), patient: Patient())
//                    }
                }
            }
            .listStyle(.plain)
            .font(.title)
            .disabled(patient.id == nil ? false : true)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(patient.id == nil)
            .toolbar{
                if patient.id == nil {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Sign Out"){
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save"){
                            Task{
                                let success = await patientVM.savePatient(patient: patient)
                                if success {
                                    dismiss()
                                } else {
                                    print("Error saving patient.")
                                }
                            }
                            dismiss()
                        }
                    }
                }
            }
            Spacer()
        }
        
        
    }
}

struct PatientDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            PatientDetailView(patient: Patient())
                .environmentObject(PatientViewModel())
        }
    }
}
