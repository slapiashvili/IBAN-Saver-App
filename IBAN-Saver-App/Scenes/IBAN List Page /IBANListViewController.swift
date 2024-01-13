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
    private let navigationCoordinator: NavigationCoordinator
    
    //MARK: - Properties
    @StateObject var viewModel: IBANListViewModel = .init()
    @State private var isShowingDetails = false
    @State private var selectedUser: RegUser
    
    
    init(holder: NavigationStackHolder, navigationCoordinator: NavigationCoordinator, user: RegUser) {
        self.holder = holder
        self.navigationCoordinator = NavigationCoordinator(holder: holder)
        self.selectedUser = user
    }
    
    
    var body: some View {
        VStack {
            listTitleView
            ScrollView {
//                ForEach(viewModel, id: \.id) { user in
//                    ListRowView(user: user)
//                        .onTapGesture {
//                            navigationCoordinator.presentIBANListDetailView(user: user)
//                        }
//                }
                //                   ForEach(viewModel.users, id: \.id) { user in
                //                       ListRowView(user: user)
                //                           .onTapGesture {
                //                               navigationCoordinator.presentIBANListDetailView(user: user)
                //                           }
                //                   }
                Text(selectedUser.username)
            }
            addPersonButton
        }
    }
    
    
    
    private var listView: some View {
        
        List{
            //            ForEach(viewModel.users, id: \.id) { user in
            //                ListRowView(user: user)
            //                    .onTapGesture {
            //                        selectedUser = user
            //                        isShowingDetails = true
            //
            //                    }
            //            }
            
        }
    }
    //    private var listView: some View {
    //
    //        List{
    //            ForEach(viewModel.users, id: \.id) { user in
    //                ListRowView(user: user)
    //                    .onTapGesture {
    //                        selectedUser = user
    //                        isShowingDetails = true
    //
    //                    }
    //            }
    //
    //        }
    //    }
    
    private var listTitleView: some View {
        Text("IBAN List View")
        
    }
    
    private var addPersonButton: some View {
        Button("Add Person") {
            //                navigationCoordinator.presentAddPersonView()
        }
        .padding()
    }
    
}

