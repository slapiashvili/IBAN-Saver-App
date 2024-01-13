//
//  LogInView.swift
//  IBAN-Saver-App
//
//  Created by Mariam Mchedlidze on 10.01.24.
//

import SwiftUI
import FirebaseAuth

struct LogInView: ViewControllable {
    var holder: NavigationStackHolder
    let navigationCoordinator: NavigationCoordinator
    @State private var emailInput: String = ""
    @State private var passwordInput: String = ""
    @State private var viewModel = LoginViewModel()

    init(holder: NavigationStackHolder) {
        self.holder = holder
        self.navigationCoordinator = NavigationCoordinator(holder: holder)
    }
    
    var body: some View {
        ZStack {
            CustomBackground()
            LogInContentView(emailInput: $emailInput, passwordInput: $passwordInput, viewModel: viewModel, navigationCoordinator: navigationCoordinator)
        }
    }
}

// MARK: - Content
private struct LogInContentView: View {
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
}


// MARK: - Header
private struct HeaderView: View {
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
private struct TextFieldView: View {
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


// MARK: - RegisterButton
private struct RegisterButton: View {
    let navigationCoordinator: NavigationCoordinator
    
    var body: some View {
        HStack (spacing: 8) {
            Text("Don't have an account?")
                .secondaryTextStyle
            
            Button(action: {
                navigationCoordinator.navigateToRegistration()
            }) {
                Text("Register")
                    .font(.system(size: 16))
            }
            
        } .padding(.bottom, 12)
    }
}

// MARK: - SignInButton
private struct SignInButton: View {
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
            
            //                if let error {
            //                    alertTitle = "Error"
            //                    alertMessage = "Incorrect email or password. Please try again."
            //                    showAlert = true
            //                } else {
            //
            //
            //                }
            //            }
        }
        .primaryButton
        .padding(.bottom, 80)
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}



