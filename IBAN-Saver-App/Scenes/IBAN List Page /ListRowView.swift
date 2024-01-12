//
//  ListView.swift
//  IBAN-Saver-App
//
//  Created by Mariam Joglidze on 10.01.24.
//

import SwiftUI

struct ListRowView: View {
    
    //MARK: Properties
    var user: User
    
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
            .font(.title2)
    }
}

#Preview {
    ListRowView(user: User(username: "Mariam Joglidze", ibans: ["1","2"]))
}
