//
//  IBANListViewController.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 10.01.24.
//

import UIKit
import SwiftUI

struct IBANListViewController: ViewControllable {
    //MARK: - Properties
    var holder: NavigationStackHolder
    let navigationCoordinator: NavigationCoordinator
    @ObservedObject private var contactViewModel = ContactViewModel.shared
    
    @StateObject var viewModel: IBANListViewModel = .init()
    @State private var isShowingDetails = false
    @State private var selectedUser: User
    
    init(holder: NavigationStackHolder, navigationCoordinator: NavigationCoordinator, user: User) {
        self.holder = holder
        self.navigationCoordinator = NavigationCoordinator(holder: holder)
        self.selectedUser = user
    }
    
    //MARK: - Body
    var body: some View {
        VStack {
            listTitleView
            Spacer()
            Text(selectedUser.username)
            listView
            Button(action: {
                navigationCoordinator.presentAddPersonView()
            }) {
                Text("Add Person")
            }
            
        }
    }
    
    //MARK: - View
    private var listTitleView: some View {
        Text("IBAN List View")
            .font(.title)
            .bold()
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
    }
    
    private var addPersonButton: some View {
        Button("Add Person") {
            navigationCoordinator.presentAddPersonView()
        }
        .padding()
    }
    
    private var listView: some View {
        List {
            ForEach(contactViewModel.contacts, id: \.surname) { contact in
                VStack(alignment: .leading) {
                    Text("\(contact.name) \(contact.surname)")
                        .font(.headline)
                        .padding(.bottom, 2)
                }
                .onTapGesture {
                    navigationCoordinator.presentIBANListDetailView(iban: contact.ibans)
                }
            }
        }
    }
}
