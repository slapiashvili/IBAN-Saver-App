//
//  ComponentsView.swift
//  IBAN-Saver-App
//
//  Created by Mariam Mchedlidze on 10.01.24.
//

import SwiftUI

// MARK: - Background
struct Background: View {
    var body: some View {
        Image("background")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - TextfieldStyle
struct CustomTextFieldStyle: TextFieldStyle {
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

// MARK: - MainButtonStyle
struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.vertical, 16)
            .frame(minWidth: 0, maxWidth: 248)
            .background(Color.yellow)
            .foregroundColor(.black)
            .font(.system(size: 16, weight: .bold))
            .cornerRadius(16)
    }
}

