//
//  RegistrationViewModel.swift
//  IBAN-Saver-App
//
//  Created by Davit Natenadze on 11.01.24.
//

import SwiftUI
import FirebaseAuth
import Firebase

final class RegistrationViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let welcomeTitle = "Welcome"
    let welcomeText = "We're thrilled to see you!"
    let welcomeActionText = "Let's sign you up"
    @Published var isRegistrationSuccessful = false
   
    // MARK: - Methods
    func registerUser(email: String, username: String, password: String) {
        ApiManager.registerUser(email: email, username: username, password: password) { success in
            if success {
                withAnimation(.easeIn) {
                    self.isRegistrationSuccessful = true
                }
            }
        }
        
//        ApiManager.loginUser(email: email, password: password)
        
//        let iban = IBANStruct(name: "margo", surname: "jincharadze", ibanNumber: "ssd23sda2213213", bankName: "Tao")
//        ApiManager.addIbanToUser(iban: iban)
        
//        ApiManager.fetchLoggedInUserData()
       
    }
    
    func isPasswordCriteriaMet(text: String) ->  Bool {
        lengthAndNoSpaceMet(text) &&
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
