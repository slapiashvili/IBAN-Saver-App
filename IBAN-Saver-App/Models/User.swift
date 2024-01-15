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
    var uid: String
    
    init(uid: String, dictionary: [String: Any], contacts: [Contact]) {
        self.uid = uid
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.contacts = contacts
    }
}

struct Contact {
    var name: String
    var surname: String
    var ibans: [Iban]
  
    
    init(name: String, surname: String, ibans: [Iban]) {
        self.name = name
        self.surname = surname
        self.ibans = ibans
    }
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String ?? ""
        self.surname = dictionary["surname"] as? String ?? ""
        self.ibans = dictionary["ibans"] as? [Iban] ?? []
    }
}

struct Iban {
    var ibanNumber: String
    var bankName: String
}
