//
//  SignInButton.swift
//  IBAN-Saver-App
//
//  Created by Mariam Mchedlidze on 13.01.24.
//

import SwiftUI

struct SignInButton: View {
    
    // MARK: - Properties
    var viewModel: LoginViewModel
    let navigationCoordinator: NavigationCoordinator
    var emailInput: String
    var passwordInput: String
    
    @State private var showAlert = false
    @State private var alertTitle = "Error"
    @State private var alertMessage = "Invalid email or password. Please try again."
    
    var body: some View {
        Button("Sign In") {
            viewModel.login(email: emailInput, password: passwordInput) { user in
                navigationCoordinator.navigateToIbanList(user: user)
            } onFailure: { error in
                showAlert = true
            }
        }
        .primaryButton
        .padding(.bottom, 80)
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}
