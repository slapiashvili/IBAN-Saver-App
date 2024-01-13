//
//  ContentView.swift
//  IBAN-Saver-App
//
//  Created by Mariam Mchedlidze on 13.01.24.
//

import SwiftUI

struct LogInContentView: View {
    
    // MARK: - Properties
    @Binding var emailInput: String
    @Binding var passwordInput: String
    
    var viewModel: LoginViewModel
    let navigationCoordinator: NavigationCoordinator
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HeaderView()
                TextFieldView(emailInput: $emailInput, passwordInput: $passwordInput)
                    .padding(.top, 60)
            } .padding(.horizontal, 24)
            Spacer()
            RegisterButton(navigationCoordinator: navigationCoordinator)
            SignInButton(viewModel: viewModel, navigationCoordinator: navigationCoordinator, emailInput: emailInput, passwordInput: passwordInput)
        }
    }
    
    // MARK: - Header
    struct HeaderView: View {
        var body: some View {
            VStack (alignment: .leading, spacing: 20) {
                Text("Welcome back!")
                    .headerTextStyle
                
                VStack (alignment: .leading, spacing: 4) {
                    
                    Text("We're thrilled to see you again!")
                        .primaryTextStyle
                    
                    Text("Let's sign you in")
                        .primaryTextStyle
                }
            }.padding(.top, 100)
        }
    }
    
    // MARK: - Textfield
     struct TextFieldView: View {
         
         // MARK: - Properties
        @Binding var emailInput: String
        @Binding var passwordInput: String
        
        var body: some View {
            VStack(alignment: .trailing, spacing: 8) {
                VStack(alignment: .leading, spacing: 16) {
                    CustomTextFieldView(text: $emailInput, placeholder: "Email or Username", isSecure: false)
                    CustomTextFieldView(text: $passwordInput, placeholder: "Password", isSecure: true)
                }
                Text("Forgot Password?")
                    .primaryTextStyle
            }
        }
    }
}
