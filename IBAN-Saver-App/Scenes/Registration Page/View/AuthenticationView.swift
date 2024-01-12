//
//  AuthenticationView.swift
//  IBAN-Saver-App
//
//  Created by Davit Natenadze on 11.01.24.
//

import SwiftUI

struct AuthenticationView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = RegistrationViewModel()
    @State private var emailInput: String = ""
    @State private var passwordInput: String = ""
    
   // MARK: - Body
    var body: some View {
        ZStack {
            background
            mainContent
        }
    }
}


// MARK: - Extensions
private extension AuthenticationView {
    
    var background: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    var mainContent: some View {
        VStack {
            VStack(alignment: .leading) {
                header
                textFieldStack
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            SignUpButtonView(title: "Sign Up")
        }
    }
}

// MARK: - Header
private extension AuthenticationView {
    
    var header: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text(viewModel.welcomeTitle)
                .modifier(TextModifier.header)
            
            VStack (alignment: .leading, spacing: 4) {
                Text(viewModel.welcomeText)
                    .modifier(TextModifier.primary)
                
                Text(viewModel.welcomeActionText)
                    .modifier(TextModifier.primary)
                
            }
        }.padding(.top, 100)
    }
}

// MARK: - TextField Stack
private extension AuthenticationView {
    
    var textFieldStack: some View {
        RegTextFieldView(emailInput: $emailInput, passwordInput: $passwordInput)
            .padding(.top, 60)
    }
}
    

// MARK: - Button
extension AuthenticationView {
    
    func SignUpButtonView(title: String) -> some View {
        Button(title) {
            viewModel.registerUser(email: emailInput, password: passwordInput)
        }
        .buttonStyle(PrimaryButtonStyle1())
        .padding(.horizontal)
        .padding(.bottom, 80)
    }
    
}


// MARK: - Preview
#Preview {
    AuthenticationView()
}
