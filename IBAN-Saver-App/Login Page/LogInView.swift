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
    
    private struct RegisterButtonView: View {
        var body: some View {
            HStack (spacing: 8) {
                Text("Don't have an account?")
                    .font(.system(size: 16))
                    .foregroundColor(.white.opacity(0.6))
                
                Text("Register")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            } .padding(.bottom, 12)
        }
    }
        
    private struct SignInButtonView: View {
        var body: some View {
            Button("Sign In") {
                // TO BE DONE
            }
            .buttonStyle(CustomButtonStyle())
            .padding(.bottom, 80)
        }
    }
}

#Preview {
    LogInView()
}

//MARK: - Components

struct Background: View {
    var body: some View {
        Image("background")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
    }
}

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

