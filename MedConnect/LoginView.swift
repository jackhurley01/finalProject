//
//  LoginView.swift
//  MedConnect
//
//  Created by Jack Hurley on 12/7/22.
//

import SwiftUI
import Firebase

struct LoginView: View {
    enum Field {
        case email, password
    }
    
    @State private var email = ""
    @State private var password = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var buttonDisabled = true
    @State private var presentPatientSheet = false
    @State private var presentDoctorSheet = false
    @State var patient: Patient
    
    @State private var userSelection: User = .pat

    @FocusState private var focusField : Field?
    
    
    enum User: String, Codable, CaseIterable{
        case pat = "Patient"
        case doc = "Doctor"
    }
    
    var body: some View {
        NavigationStack {
            
            Spacer()
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding()
            Group {
                TextField("E-Mail", text: $email)
                SecureField("Password", text: $password)
            }
            .textFieldStyle(.roundedBorder)
            .overlay{
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color("MedBlue"), lineWidth: 2)
            }
            .padding(.horizontal)
            
            HStack{
                Button {
                    register()
                } label: {
                    Text("Sign Up")
                }
                .padding(.trailing)
                Button {
                    login()
                } label: {
                    Text("Log In")
                }
                .padding(.leading)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("MedBlue"))
            .font(.title3)
            .padding(.top)
            
            Spacer()
            
            Picker("", selection: $userSelection, content: {
                ForEach(User.allCases, id: \.self) { user in
                    Text(user.rawValue)
                }
            })
            .pickerStyle(.segmented)
            .padding()
            
            
        }

        .alert(alertMessage, isPresented: $showingAlert) {
            Button("OK", role: .cancel){}
        }

        .onAppear {
            if Auth.auth().currentUser != nil {
                if userSelection == .pat {
                    print("Login Successful!")
                    presentPatientSheet = true
                }
                else {
                    print("Login Successful!")
                    presentDoctorSheet = true
                }
            }
        }
        .fullScreenCover(isPresented: $presentPatientSheet) {
            PatientDetailView(patient: patient)
        }
        .fullScreenCover(isPresented: $presentDoctorSheet) {
            DoctorDetailView()
        }
    }
    
    func enableButtons() {
        let emailIsGood = email.count >= 6 && email.contains("@")
        let passwordIsGood = password.count >= 6
        buttonDisabled = !(emailIsGood && passwordIsGood)
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("SIGN-UP ERROR: \(error.localizedDescription)")
                alertMessage = "SIGN-UP ERROR: \(error.localizedDescription)"
                showingAlert = true
            } else {
                if userSelection == .pat {
                    print("Registration Success!")
                    presentPatientSheet = true
                }
                else {
                    print("Registration Success!")
                    presentDoctorSheet = true
                }
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("LOGIN ERROR: \(error.localizedDescription)")
                alertMessage = "LOGIN ERROR: \(error.localizedDescription)"
                showingAlert = true
            } else {
                
                if userSelection == .pat {
                    print("Login Successful!")
                    presentPatientSheet = true
                }
                else {
                    print("Login Successful!")
                    presentDoctorSheet = true
                }

            }
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(patient: Patient())
    }
}
