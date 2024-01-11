//
//  LogInView.swift
//  IBAN-Saver-App
//
//  Created by Mariam Mchedlidze on 10.01.24.
//

import SwiftUI

struct LogInView: View {
    var body: some View {
        ZStack {
            CustomBackground()
            LogInContentView()
        }
    }
    
    // MARK: - Content
    private struct LogInContentView: View {
        var body: some View {
            VStack {
                VStack(alignment: .leading) {
                    HeaderView()
                    TextFieldView()
                        .padding(.top, 60)
                } .padding(.horizontal, 24)
                Spacer()
                RegisterButtonView()
                SignInButtonView()
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
        @State private var emailInput: String = ""
        @State private var passwordInput: String = ""
        
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
    private struct RegisterButtonView: View {
        var body: some View {
            HStack (spacing: 8) {
                Text("Don't have an account?")
                    .secondaryTextStyle
                
                Text("Register")
                    .font(.system(size: 16))
                // TO BE DONE: Navigation to Register
            } .padding(.bottom, 12)
        }
    }
    
    // MARK: - SignInButton
    private struct SignInButtonView: View {
        var body: some View {
            Button("Sign In") {
                // TO BE DONE: Navigation to List Page
            }
            .primaryButton
            .padding(.bottom, 80)
        }
    }
}

#Preview {
    LogInView()
}
