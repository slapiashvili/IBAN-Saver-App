//
//  AddIBANModel.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 10.01.24.
//

import Foundation

final class User {
    var email: String
    var username: String
    var ibans: [IBANStruct]
    
    static var current: User?
    
    init(name: String, username: String, ibans: [IBANStruct] = []) {
        self.email = name
        self.username = username
        self.ibans = ibans
    }
}
 
struct IBANStruct {
    var name: String
    var surname: String
    var ibanNumber: String
    var bankName: String
}


