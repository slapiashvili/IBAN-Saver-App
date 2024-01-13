//
//  User.swift
//  IBAN-Saver-App
//
//  Created by Davit Natenadze on 13.01.24.
//

import Foundation

struct User {
    var username: String
    var email: String
    var contacts: [Contact]
}

struct Contact {
    var name: String
    var surname: String
    var ibans: [Iban]
}

struct Iban {
    var ibanNumber: String
    var bankName: String
}
