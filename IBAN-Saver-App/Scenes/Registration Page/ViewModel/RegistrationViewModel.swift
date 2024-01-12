//
//  RegistrationViewModel.swift
//  IBAN-Saver-App
//
//  Created by Davit Natenadze on 11.01.24.
//

import Foundation
import FirebaseAuth

final class RegistrationViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let welcomeTitle = "Welcome"
    let welcomeText = "We're thrilled to see you!"
    let welcomeActionText = "Let's sign you up"
   
    // MARK: - Methods
    func registerUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error {
                print("DEBUG Error is \(error.localizedDescription)")
                return
            }
            
            print("Successful registration")
        }
    }
}
