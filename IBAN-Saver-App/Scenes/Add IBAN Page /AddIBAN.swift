//
//  AddIBAN.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 12.01.24.
//

import SwiftUI

struct AddIBAN: ViewControllable {
    
    var holder: NavigationStackHolder
    let navigationCoordinator: NavigationCoordinator
    
    init(holder: NavigationStackHolder) {
        self.holder = holder
        self.navigationCoordinator = NavigationCoordinator(holder: holder)
    }
    
    @State private var successMessage: String? = nil
    @State private var ibanNumber = ""
    @State private var bankName = ""
    
    var body: some View {
        ZStack {
            CustomBackground()
            VStack(spacing: 20) {
                Text("Please fill in the following information")
                    .modifier(TextModifier.header)
                
                CustomTextFieldView(text: $ibanNumber, placeholder: "IBAN Number", isSecure: false)
                
                CustomTextFieldView(text: $bankName, placeholder: "Bank Name", isSecure: false)
                
                
                Button(action: {
                    Task.detached {
                        await addIBAN()
                    }
                }) {
                    Text("Add IBAN")
                        .frame(height: 44)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.ibanText)
                        .background(.ibanButton)
                        .cornerRadius(8)
                        .padding(.bottom, 80)
                }
                
                if let message = successMessage {
                    Text(message)
                        .foregroundColor(.green)
                        .padding()
                }
            }
            .padding()
        }
    }
    
    func addIBAN() async {
        do {
                    
            successMessage = "You have successfully added the IBAN to the existing person's database"
            
            ibanNumber = ""
            bankName = ""
            
            try await Task.sleep(nanoseconds: 2_000_000_000)
            
            successMessage = "Would you like to add another?"
        } catch {
            print("Error: \(error)")
            successMessage = "An error occurred while adding an IBAN."
        }
    }

}
