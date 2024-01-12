//
//  Styles.swift
//  IBAN-Saver-App
//
//  Created by Davit Natenadze on 11.01.24.
//

import SwiftUI

    
// MARK: - Textfield
struct CustomTextFieldView1: View {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if isSecure {
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.white.opacity(0.6))
                            .padding(.horizontal, 16)
                    }
                    SecureField("", text: $text)
                        .textFieldStyle(CustomTextFieldStyle1())
                }
            } else {
                TextField(placeholder, text: $text, prompt: Text(placeholder).foregroundColor(.white.opacity(0.6)))
                    .textFieldStyle(CustomTextFieldStyle1())
            }
        }
    }
}

// MARK: - TextfieldStyle
struct CustomTextFieldStyle1: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white.opacity(0.4), lineWidth: 1)
            )
            .foregroundColor(.white)
    }
}
