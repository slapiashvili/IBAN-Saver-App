//
//  RegTextFieldView.swift
//  IBAN-Saver-App
//
//  Created by Davit Natenadze on 11.01.24.
//

import SwiftUI

struct RegTextFieldView: View {
    @Binding var username: String
    @Binding var emailInput: String
    @Binding var passwordInput: String
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 8) {
            VStack(alignment: .leading, spacing: 16) {
                CustomTextFieldView1(text: $username, placeholder: "Username")
                CustomTextFieldView1(text: $emailInput, placeholder: "Email")
                CustomTextFieldView1(text: $passwordInput, placeholder: "Password", isSecure: true)
                  
            }
        }
    }
}


struct CustomTextFieldView1: View {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool = false
    
    var body: some View {
            ZStack(alignment: .trailing) {
                if isSecure {
                    SecureField(placeholder, text: $text, prompt:
                                    Text(placeholder).foregroundColor(.ibanText.opacity(0.7)))
                } else {
                    TextField(placeholder, text: $text, prompt:
                                Text(placeholder).foregroundColor(.ibanText.opacity(0.7)))
                }
                
                if !text.isEmpty {
                    Button(action: {
                        text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.ibanText.opacity(0.6))
                            .padding(8)
                    }
                }
            }
            .textFieldStyle(CustomTextFieldStyle1())
    }
}


// MARK: - TextfieldStyle
struct CustomTextFieldStyle1: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.ibanText.opacity(0.4), lineWidth: 1)
            )
            .foregroundColor(.ibanText)
            .autocorrectionDisabled()
    }
}

