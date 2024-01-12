//
//  CustomTextFieldView.swift
//  IBAN-Saver-App
//
//  Created by Mariam Mchedlidze on 11.01.24.
//

import SwiftUI

struct CustomTextFieldView: View {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool
    
    var body: some View {
        if isSecure {
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .padding(.horizontal, 16)
                        .foregroundColor(.gray)
                }
                SecureField("", text: $text)
                    .textFieldStyle(CustomTextFieldStyle())
            }
        } else {
            TextField(placeholder, text: $text, prompt: Text(placeholder).foregroundColor(Color.gray))
                .textFieldStyle(CustomTextFieldStyle())
        }
    }
    
    struct CustomTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.opacity(0.4), lineWidth: 1)
                )
        }
    }
}

