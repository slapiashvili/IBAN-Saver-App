//
//  IBANListViewController.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 10.01.24.
//

import UIKit
import SwiftUI

struct IBANListViewController: View {
    //MARK: - Properties
    @StateObject var viewModel: IBANListViewModel = .init()
    @State private var isShowingDetails = false
    @State private var selectedUser: User?

    
    var body: some View {
        VStack {
            listTitleView
            listView
        }
        .sheet(isPresented: $isShowingDetails) {
            if let user = selectedUser {
                IBANListDetailView(user: user)
            }
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
}

#Preview {
    IBANListViewController()
}
