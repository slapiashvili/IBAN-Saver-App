//
//  RegTextFieldView.swift
//  IBAN-Saver-App
//
//  Created by Davit Natenadze on 11.01.24.
//

import SwiftUI

struct RegTextFieldView: View {
    @Binding var emailInput: String
    @Binding var passwordInput: String
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 8) {
            VStack(alignment: .leading, spacing: 16) {
                CustomTextFieldView1(text: $emailInput, placeholder: "Email")
                CustomTextFieldView1(text: $passwordInput, placeholder: "Password", isSecure: true)
            }
        }
    }
}
