//
//  AddIBAN.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 12.01.24.
//

import SwiftUI

struct AddIBAN: ViewControllable {
    
    var holder: NavigationStackHolder

    @State private var successMessage: String? = nil
    @State private var ibanNumber = ""
    @State private var bankName = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Please fill in the following information")
                .font(.title)
            
            TextField("IBAN Number", text: $ibanNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Bank Name", text: $bankName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                Task.detached {
                    await addIBAN()
                }
            }) {
                Text("Add IBAN")
            }
            
            if let message = successMessage {
                Text(message)
                    .foregroundColor(.green)
                    .padding()
            }
        }
        .padding()
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
