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
    var retriveUser: String
    
    //MARK: - Body
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 55) {
                Spacer()
                listTitleView
                listView
            }
            CustomBackground()
        }
    }
    
    //MARK: - Views
    private var listView: some View {
        List{
            ForEach(viewModel.addedusers, id: \.id) { addeduser in
                ListRowView(user: addeduser)
            }
        }
    }
    
    private var textView: some View {
        Text(retriveUser)
            .font(.title3)
            .bold()
            .lineLimit(1)
            .padding(.horizontal, 20)
    }
    
    private var listTitleView: some View {
        Text("Hello \(retriveUser)")
            .font(.title)
            .bold()
            .foregroundStyle(.orange)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
    }
}


#Preview {
    IBANListViewController(retriveUser: "john")
}
