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
    
    func isPasswordCriteriaMet(text: String) ->  Bool {
        lengthCriteriaMet(text) &&
        uppercaseMet(text) &&
        lowercaseMet(text) &&
        digitMet(text) &&
        specialCharMet(text)
    }

    
    // MARK: - Password Criteria Methods
    func lengthCriteriaMet(_ text: String) -> Bool {
        text.count >= 8 && text.count <= 32
    }
    
    func noSpaceCriteriaMet(_ text: String) -> Bool {
        text.rangeOfCharacter(from: NSCharacterSet.whitespaces) == nil
    }
        
    func lengthAndNoSpaceMet(_ text: String) -> Bool {
        lengthCriteriaMet(text) && noSpaceCriteriaMet(text)
    }
    
    func uppercaseMet(_ text: String) -> Bool {
        text.range(of: "[A-Z]+", options: .regularExpression) != nil
    }
    
    func lowercaseMet(_ text: String) -> Bool {
        text.range(of: "[a-z]+", options: .regularExpression) != nil
    }
    
    func digitMet(_ text: String) -> Bool {
        text.range(of: "[0-9]+", options: .regularExpression) != nil
    }
    
    func specialCharMet(_ text: String) -> Bool {
        let pattern = #"[^a-zA-Z0-9]+"#   // "[@:?!()$#§%,./\\\\]+" if explicitly defined needed
        return text.range(of: pattern, options: .regularExpression) != nil
    }
}
