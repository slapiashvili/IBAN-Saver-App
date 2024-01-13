//
//  AuthenticationView.swift
//  IBAN-Saver-App
//
//  Created by Davit Natenadze on 11.01.24.
//

import SwiftUI

struct AuthenticationView: ViewControllable {
    
    var holder: NavigationStackHolder
    let navigationCoordinator: NavigationCoordinator
    
    init(holder: NavigationStackHolder) {
        self.holder = holder
        self.navigationCoordinator = NavigationCoordinator(holder: holder)
        
    }
    
    // MARK: - Properties
    @StateObject private var viewModel = RegistrationViewModel()
    @State private var username: String = ""
    @State private var emailInput: String = ""
    @State private var passwordInput: String = ""
    @State private var passwordStatusView = PasswordStatusView()
    
   // MARK: - Body
    var body: some View {
        ZStack {
            background
            mainContent
            if viewModel.isRegistrationSuccessful {
                successAnimation
            }
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
        VStack(alignment: .leading, spacing: 16) {
            header
            textFieldStack
            passwordStatusView
            
            Spacer()
            
            SignUpButtonView(title: "Sign Up")
        }
        .padding(.horizontal, 16)
    }
    
    var successAnimation: some View {
        SuccessAnimationView()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.easeIn) {
                        viewModel.isRegistrationSuccessful = false
                    }
                }
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
        RegTextFieldView(username: $username, emailInput: $emailInput, passwordInput: $passwordInput)
            .padding(.top, 60)
            .onChange(of: passwordInput) { newValue in
                updatePasswordCriteriaView(with: newValue)
            }
    }
    
    func updatePasswordCriteriaView(with value: String) {
        withAnimation {
            passwordStatusView.lengthCriteriaView.isCriteriaMet = viewModel.lengthAndNoSpaceMet(value)
            passwordStatusView.uppercaseCriteriaView.isCriteriaMet = viewModel.uppercaseMet(value)
            passwordStatusView.lowerCaseCriteriaView.isCriteriaMet = viewModel.lowercaseMet(value)
            passwordStatusView.digitCriteriaView.isCriteriaMet = viewModel.digitMet(value)
            passwordStatusView.specialCharacterCriteriaView.isCriteriaMet = viewModel.specialCharMet(value)
        }
    }
}
    

// MARK: - Button
extension AuthenticationView {
    
    func SignUpButtonView(title: String) -> some View {
        Button(title) {
            viewModel.registerUser(email: emailInput, username: username, password: passwordInput)
            navigationCoordinator.navigateToLogIn()
        }
        .frame(height: 44)
        .frame(maxWidth: .infinity)
        .font(.system(size: 16, weight: .bold))
        .foregroundColor(.black)
        .background(viewModel.isPasswordCriteriaMet(text: passwordInput) ? Color.yellow : Color.gray)
        .cornerRadius(8)
        .padding(.bottom, 80)
//        .disabled(!viewModel.isPasswordCriteriaMet(text: passwordInput))
    }
    
}


