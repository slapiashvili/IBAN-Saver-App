//
//  PasswordStatusView.swift
//  IBAN-Saver-App
//
//  Created by Davit Natenadze on 12.01.24.
//

import SwiftUI

struct PasswordStatusView: View {
    
    var lengthCriteriaView = PasswordCriteriaView(text: "8-32 characters (no spaces)")
    var uppercaseCriteriaView = PasswordCriteriaView(text: "uppercase letter (A-Z)")
    var lowerCaseCriteriaView = PasswordCriteriaView(text: "lowercase (a-z)")
    var digitCriteriaView = PasswordCriteriaView(text: "digit (0-9)")
    var specialCharacterCriteriaView = PasswordCriteriaView(text: "special character (e.g. !@#$%^)")
    
    var shouldResetCriteria: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            lengthCriteriaView
            uppercaseCriteriaView
            lowerCaseCriteriaView
            digitCriteriaView
            specialCharacterCriteriaView
        }
    }
}


