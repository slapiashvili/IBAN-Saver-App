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
            Background ()
            ContentView()
        }
    }
    
    // MARK: - Content
    private struct ContentView: View {
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
                    .font(.system(size: 30, weight: .medium))
                    .foregroundColor(.yellow)
                
                VStack (alignment: .leading, spacing: 4) {
                    Text("We're thrilled to see you again!")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                    
                    Text("Let's sign you in")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                }
            }.padding(.top, 80)
        }
    }
    
    // MARK: - Textfield
    private struct TextFieldView: View {
        @State private var emailInput: String = ""
        @State private var passwordInput: String = ""
        
        var body: some View {
            VStack(alignment: .trailing, spacing: 12) {
                VStack (spacing: 12) {
                    TextField("",
                              text: $emailInput,
                              prompt: Text("Email or Username")
                        .foregroundColor(.white.opacity(0.6))
                    )
                    .textFieldStyle(CustomTextFieldStyle())
                    
                    SecureField("",
                                text: $passwordInput,
                                prompt: Text("Password")
                        .foregroundColor(.white.opacity(0.6))
                    )
                    .textFieldStyle(CustomTextFieldStyle())
                }
                Text("Forgot Password?")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            }
        }
    }
    
    // MARK: - RegisterButton
    private struct RegisterButtonView: View {
        var body: some View {
            HStack (spacing: 8) {
                Text("Don't have an account?")
                    .font(.system(size: 16))
                    .foregroundColor(.white.opacity(0.6))
                
                Text("Register")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
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
            .buttonStyle(CustomButtonStyle())
            .padding(.bottom, 80)
        }
    }
}

#Preview {
    LogInView()
}

