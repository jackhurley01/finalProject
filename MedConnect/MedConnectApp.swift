//
//  MedConnectApp.swift
//  MedConnect
//
//  Created by Jack Hurley on 12/7/22.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct MedConnectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var patientVM = PatientViewModel()
    
    var body: some Scene {
        WindowGroup {
            LoginView(patient: Patient())
                .environmentObject(patientVM)
        }
    }
}
