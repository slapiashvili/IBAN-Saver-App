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
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        Button("Sign In") {
            viewModel.login(email: emailInput, password: passwordInput) { user in
                navigationCoordinator.navigateToIbanList(user: user)
            }
        }
        .primaryButton
        .padding(.bottom, 80)
    }
}

