//
//  AddIBANViewController.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 10.01.24.
//

import UIKit
import VisionKit
import SwiftUI


struct AddPerson: ViewControllable {
    
    // MARK: - Properties
    var holder: NavigationStackHolder
    let navigationCoordinator: NavigationCoordinator
    @State private var isShowingScanner = false
    @State private var successMessage: String? = nil
    @ObservedObject private var viewModel = ContactViewModel.shared
    @State private var name = ""
    @State private var surname = ""
    @State private var ibanNumber = ""
    @State private var bankName = ""
    @State private var ibans: [Iban] = []
    
    // MARK: - Init
    init(holder: NavigationStackHolder) {
        self.holder = holder
        self.navigationCoordinator = NavigationCoordinator(holder: holder)
    }
    
    // MARK: - Views
       private var headerView: some View {
           Text("Please fill in the following information")
               .modifier(TextModifier.header)
       }
       
       private var nameTextField: some View {
           CustomTextFieldView(text: $name, placeholder: "Name", isSecure: false)
       }
       
       private var surnameTextField: some View {
           CustomTextFieldView(text: $surname, placeholder: "Surname", isSecure: false)
       }
       
       private var ibanTextField: some View {
           CustomTextFieldView(text: $ibanNumber, placeholder: "IBAN Number", isSecure: false)
       }
       
       private var bankNameTextField: some View {
           CustomTextFieldView(text: $bankName, placeholder: "Bank Name", isSecure: false)
       }
       
       private var addButton: some View {
           Button(action: {
               let iban = Iban(ibanNumber: ibanNumber, bankName: bankName)
               let contact = Contact(name: name, surname: surname, ibans: [iban])
               ApiManager.addContactToUser(contact: contact)
               
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
       }
    
    private var scanButton: some View {
            Button(action: {
                isShowingScanner.toggle()
            }) {
                Text("Scan IBAN QR Code")
            }
        }
        
        private var scannerSheet: some View {
            sheet(isPresented: $isShowingScanner) {
                if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                    DataScannerRepresentable(
                        shouldStartScanning: $isShowingScanner,
                        scannedText: $ibanNumber,
                        ibanTextBinding: $ibanNumber,
                        dataToScanFor: [.barcode(symbologies: [.qr])]
                    )
                } else {
                    Text("Scanner is not supported or not available.")
                }
            }
        }

       
       // MARK: - Body
       var body: some View {
           ZStack{
               CustomBackground()
               VStack(spacing: 20) {
                   headerView
                   nameTextField
                   surnameTextField
                   scanButton
                   ibanTextField
                   bankNameTextField
                   addButton
               }
               .padding()
           }
       }
    
    func addPerson() async {
        do {

            let ibansArray = Iban(ibanNumber: ibanNumber, bankName: bankName)
            viewModel.addContact(name: name, surname: surname, ibans: [ibansArray])

            try await Task.sleep(nanoseconds: 1_000_000_000)
            
            successMessage = "Would you like to add another?"
        } catch {
            print("Error: \(error)")
            successMessage = "An error occurred while adding a person."
        }
    }
}

// MARK: - ViewModel
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


