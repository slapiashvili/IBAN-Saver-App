//
//  ListView.swift
//  IBAN-Saver-App
//
//  Created by Mariam Joglidze on 10.01.24.
//

import SwiftUI

struct ListRowView: View {
    //MARK: Properties
    var user: RegUser
    
    //MARK: Body
    var body: some View {
        VStack{
            nameInfoView
        }
        .foregroundColor(.black)
    }
    
    //MARK: Properties    
    private var nameInfoView: some View {
        Text(user.username)
                .font(.title)
    }
}

