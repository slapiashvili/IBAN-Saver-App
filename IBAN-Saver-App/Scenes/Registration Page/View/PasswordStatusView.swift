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
    
    // MARK: - Methods
//    func updateDisplay(_ text: String) {
//        let lengthAndNoSpaceMet = PasswordCriteria.lengthAndNoSpaceMet(text)
//        let uppercaseMet = PasswordCriteria.uppercaseMet(text)
//        let lowercaseMet = PasswordCriteria.lowercaseMet(text)
//        let digitMet = PasswordCriteria.digitMet(text)
//        let specialCharMet = PasswordCriteria.specialCharMet(text)
//        
//        if shouldResetCriteria {
//            // Inline validation (✅ or ⚪️)
//            lengthAndNoSpaceMet
//            ? lengthCriteriaView.isCriteriaMet = true
//            : lengthCriteriaView.reset()
//            
//            uppercaseMet
//            ? uppercaseCriteriaView.isCriteriaMet = true
//            : uppercaseCriteriaView.reset()
//            
//            lowercaseMet
//            ? lowerCaseCriteriaView.isCriteriaMet = true
//            : lowerCaseCriteriaView.reset()
//            
//            digitMet
//            ? digitCriteriaView.isCriteriaMet = true
//            : digitCriteriaView.reset()
//            
//            specialCharMet
//            ? specialCharacterCriteriaView.isCriteriaMet = true
//            : specialCharacterCriteriaView.reset()
//        }
//    }
    
 
}


#Preview {
    PasswordStatusView()
}
