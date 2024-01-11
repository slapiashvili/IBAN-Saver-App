//
//  DetailView.swift
//  IBAN-Saver-App
//
//  Created by Mariam Joglidze on 10.01.24.
//

import SwiftUI

struct DetailView: View {
    var IBAN: String
    @State private var showCopyAlert = false
    @State private var showShareAlert = false
    @State private var showDeleteConfirmation = false
    
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            IBANView
            
            HStack(spacing: 5) {
                ButtonComponent(buttonTitle: "Copy") {
                    copyToClipboard(IBAN)
                    alertMessage = "Copied to Clipboard"
                    showCopyAlert = true
                }
                .buttonStyle(BorderlessButtonStyle())

                
                ButtonComponent(buttonTitle: "Share") {
                    alertMessage = "You can share"
                    showShareAlert = true
                }
                .buttonStyle(BorderlessButtonStyle())

                
                ButtonComponent(buttonTitle: "Delete") {
                    showDeleteConfirmation = true
                }
                .buttonStyle(BorderlessButtonStyle())

            }
        }
        .alert(isPresented: $showCopyAlert) {
            Alert(title: Text("Alert"), message: Text(alertMessage), dismissButton: .default(Text("OK")) {
                showCopyAlert = false
            })
        }
        .alert(isPresented: $showShareAlert) {
            Alert(title: Text("Alert"), message: Text(alertMessage), dismissButton: .default(Text("OK")) {
                showShareAlert = false
            })
        }
        .alert(isPresented: $showDeleteConfirmation) {
            Alert(
                title: Text("Delete Account"),
                message: Text("Are you sure you want to delete this IBAN?"),
                primaryButton: .destructive(Text("Delete")) {
                    onDeleteAccount()
                },
                secondaryButton: .cancel()
            )
        }
    }
    
    private var IBANView: some View {
        Text(IBAN)
            .font(.title3)
            .bold()
    }
    
    private func copyToClipboard(_ text: String) {
        UIPasteboard.general.string = text
    }
    
    private func onDeleteAccount() {
        // YourService.deleteAccount(with: IBAN)
    }
}

#Preview {
    DetailView(IBAN: "BAGAGE2228939489504")
}
