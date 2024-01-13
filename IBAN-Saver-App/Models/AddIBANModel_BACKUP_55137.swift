//
//  AddIBANModel.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 10.01.24.
//

import Foundation

<<<<<<< HEAD
//final class User {
//    var email: String
//    var password: String
//    var ibans: [IBANStruct]
//    
//    static var current: User?
//    
//    init(name: String, password: String, ibans: [IBANStruct] = []) {
//        self.email = name
//        self.password = password
//        self.ibans = ibans
//    }
//}
// 
//struct IBANStruct {
//    var name: String
//    var surname: String
//    var ibanNumber: String
//    var bankName: String
//}
=======
final class RegUser {
    var email: String
    var username: String
    var ibans: [IBANStruct]
    
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
>>>>>>> development


//final class User: Identifiable {
//    let id: UUID = .init()
//    
//    var username: String
//    var ibans: [String]
//    
//    init(username: String, ibans: [String]) {
//        self.username = username
//        self.ibans = ibans
//    }
//}
