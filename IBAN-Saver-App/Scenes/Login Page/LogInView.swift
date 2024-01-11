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
                    .modifier(HeaderTextStyle())
                
                VStack (alignment: .leading, spacing: 4) {
                    Text("We're thrilled to see you again!")
                        .modifier(PrimaryTextStyle())
                    
                    Text("Let's sign you in")
                        .modifier(PrimaryTextStyle())
                    
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
                    .modifier(PrimaryTextStyle())
            }
        }
    }
    
    
    // MARK: - RegisterButton
    private struct RegisterButtonView: View {
        var body: some View {
            HStack (spacing: 8) {
                Text("Don't have an account?")
                    .modifier(SecondaryTextStyle())
                
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
            .buttonStyle(PrimaryButtonStyle())
            .padding(.bottom, 80)
        }
    }
}

#Preview {
    LogInView()
}


// MARK: - Components

// MARK: - Background
struct Background: View {
    var body: some View {
        Image("background")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - Text Styles

// MARK: - PrimaryText
struct PrimaryTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .foregroundColor(Color.white)
    }
}

// MARK: - SecondaryText
struct SecondaryTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .foregroundColor(Color.white)
            .opacity(0.6)
    }
}

// MARK: - HeaderText
struct HeaderTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 30))
            .foregroundColor(Color.yellow)
    }
}

// MARK: - TextField Styles

// MARK: - TextfieldPlaceholder

struct CustomTextFieldView: View {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if isSecure {
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.white.opacity(0.6))
                            .padding(.horizontal, 16)
                    }
                    SecureField("", text: $text)
                        .textFieldStyle(CustomTextFieldStyle())
                }
            } else {
                TextField(placeholder, text: $text, prompt: Text(placeholder).foregroundColor(.white.opacity(0.6)))
                    .textFieldStyle(CustomTextFieldStyle())
            }
        }
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

// MARK: - Button Styles

// MARK: - MainButtonStyle
struct PrimaryButtonStyle: ButtonStyle {
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

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .imageScale(.large)
            .frame(width: 20, height: 20)
            .foregroundColor(Color.white.opacity(0.6))
    }
}
