//
//  AddIBANViewController.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 10.01.24.
//

import UIKit
import Vision
import SwiftUI





struct AddPerson: ViewControllable {
    
    var holder: NavigationStackHolder
        let navigationCoordinator: NavigationCoordinator
        
        init(holder: NavigationStackHolder) {
            self.holder = holder
            self.navigationCoordinator = NavigationCoordinator(holder: holder)
        }
        
        @State private var successMessage: String? = nil
        
    @ObservedObject private var viewModel = ContactViewModel.shared
        
        @State private var name = ""
        @State private var surname = ""
        @State private var ibanNumber = ""
        @State private var bankName = ""
        @State private var ibans: [Iban] = []

    
    var body: some View {
        ZStack{
            CustomBackground()
            VStack(spacing: 20) {
                Text("Please fill in the following information")
                    .modifier(TextModifier.header)
                
                CustomTextFieldView(text: $name, placeholder: "Name", isSecure: false)
                
                CustomTextFieldView(text: $surname, placeholder: "Surname", isSecure: false)
                
                CustomTextFieldView(text: $ibanNumber, placeholder: "IBAN Number", isSecure: false)
                
                CustomTextFieldView(text: $bankName, placeholder: "Bank Name", isSecure: false)
                
                Button(action: {
                    Task.detached {
                        await addPerson()
                        await holder.viewController?.dismiss(animated: true)
                    }
                }) {
                    Text("Add Person")
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
    
    func addPerson() async {
            do {
                // Store the current count of contacts before adding a new one
                let initialContactCount = viewModel.contacts.count
                
                // Create an array of Iban objects
                let ibansArray = ibans.isEmpty ? [] : [Iban(ibanNumber: ibanNumber, bankName: bankName)]
                
                // Call the addContact method from the view model
                viewModel.addContact(name: name, surname: surname, ibans: ibansArray)
                
                // Check if the count of contacts increased
                let contactAdded = viewModel.contacts.count > initialContactCount
                
                if contactAdded {
                    successMessage = "You have successfully added \(name) \(surname) to the contacts"
                } else {
                    successMessage = "An error occurred while adding a person."
                }
                
                try await Task.sleep(nanoseconds: 1_000_000_000)
                
                successMessage = "Would you like to add another?"
            } catch {
                print("Error: \(error)")
                successMessage = "An error occurred while adding a person."
            }
        }
}

public class ContactViewModel: ObservableObject {
    @Published var contacts: [Contact] = []
    static var shared = ContactViewModel.init()
    
    private init(){}
    
    func addContact(name: String, surname: String, ibans: [Iban]) {
        let newContact = Contact(name: name, surname: surname, ibans: ibans)
        contacts.append(newContact)
        print("Contact added:", newContact)
    }
}


