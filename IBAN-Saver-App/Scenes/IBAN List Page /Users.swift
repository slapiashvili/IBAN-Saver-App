//
//  Users.swift
//  IBAN-Saver-App
//
//  Created by Mariam Joglidze on 10.01.24.
//

import Foundation

final class User: Identifiable {
    let id: UUID = .init()
    
    var username: String
    var ibans: [String]
    
    init(username: String, ibans: [String]) {
        self.username = username
        self.ibans = ibans
    }
}

