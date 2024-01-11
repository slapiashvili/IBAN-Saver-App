//
//  IBANListViewModel.swift
//  IBAN-Saver-App
//
//  Created by Mariam Joglidze on 10.01.24.
//

import Foundation

final class IBANListViewModel: ObservableObject {
    //MARK: - Properties
    var users: [User] = [
        User(username: "John", ibans: ["GE21TB243400001001", "GE21TB0313414", "GE21TB133234432"]),
        User(username: "Mariam", ibans: ["GE21TB1210010029", "GE29NB0000000101904917", "GE21T1293900B133"]),
        User(username: "Salome", ibans: ["GE21TB0313414101", "GE21TB0313414", "GE21TB13310010100"]),
        User(username: "Daviti", ibans: ["GE21TB1210010029", "GE29NB000000010190491", "GE21TfdafaB133"]),
        User(username: "Mari", ibans: ["GE21TB1210010029", "GE21TB03134141333", "GE21T1293900B133"]),
        User(username: "Anna", ibans: ["GE29NB000000010190491", "GE21TB1210010029", "GE21TfdafaB133","GE21T1293900B133"])
        
    ]
}
