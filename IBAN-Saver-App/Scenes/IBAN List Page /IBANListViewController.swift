//
//  IBANListViewController.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 10.01.24.
//

import UIKit
import SwiftUI

struct IBANListViewController: ViewControllable {
    
    var holder: NavigationStackHolder
    let navigationCoordinator: NavigationCoordinator
    
    init(holder: NavigationStackHolder) {
        self.holder = holder
        self.navigationCoordinator = NavigationCoordinator(holder: holder)
    }
    
    //MARK: - Properties
    @StateObject var viewModel: IBANListViewModel = .init()
    @State private var isShowingDetails = false
    @State private var selectedUser: User?

    
    
    var body: some View {
           VStack {
               listTitleView
               ScrollView {
                   ForEach(viewModel.users, id: \.id) { user in
                       ListRowView(user: user)
                           .onTapGesture {
                               navigationCoordinator.presentIBANListDetailView(user: user)
                           }
                   }
               }
               addPersonButton
           }
       }
    
    
    
    private var listView: some View {
        
        List{
            ForEach(viewModel.users, id: \.id) { user in
                ListRowView(user: user)
                    .onTapGesture {
                        selectedUser = user
                        isShowingDetails = true
                        
                    }
            }
            
        }
    }
    
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
    
    
}
