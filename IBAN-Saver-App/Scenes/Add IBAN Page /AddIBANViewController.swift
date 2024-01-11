//
//  AddIBANViewController.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 10.01.24.
//


import UIKit
import Vision
import SwiftUI


final class AddIBANViewController: UIViewController {

    private var hostingController: UIHostingController<AddIBANSwiftUI>?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHostingController()
    }

    private func setupHostingController() {
        let addIBANSwiftUI = AddIBANSwiftUI()
        hostingController = UIHostingController(rootView: addIBANSwiftUI)

        if let hostingController = hostingController {
            let addIbanView = hostingController.view!
            addIbanView.translatesAutoresizingMaskIntoConstraints = false

            addChild(hostingController)
            view.addSubview(addIbanView)

            NSLayoutConstraint.activate([
                addIbanView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                addIbanView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
            
            hostingController.didMove(toParent: self)
        }
    }
}


struct AddIBANSwiftUI: View {
    
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var bankName: String = ""
    @State private var ibanNumber: String = ""

    private var addIbanHeaderView: some View {
        Text("add a new IBAN")
            .font(.title)
            .foregroundColor(.white)
    }

    private var nameFieldsVStack: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Surname", text: $surname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }

    private var ibanFieldsVStack: some View {
        VStack {
            TextField("Bank Name", text: $bankName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("IBAN Number", text: $ibanNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }

    private var actionButtonsHStack: some View {
        HStack {
            Button(action: {
                //TODO: -add logic for the "Add Person" button here
            }) {
                Text("Add Person")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Spacer()

            Button(action: {
                //TODO: -add logic for the "Scan IBAN" button here
            }) {
                Text("Scan IBAN")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }

    var body: some View {
        VStack {
            addIbanHeaderView
            nameFieldsVStack
            ibanFieldsVStack
            actionButtonsHStack
        }
        .background(Color.black)
    }
}

