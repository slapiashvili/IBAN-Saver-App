//
//  AddIBANModel.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 10.01.24.
//

import UIKit
import SwiftUI

//MARK: Model for persons
class Person {
    var name: String
    var surname: String
    var ibans: [IBAN]

    init(name: String, surname: String, ibans: [IBAN]) {
        self.name = name
        self.surname = surname
        self.ibans = ibans
    }
}

//MARK: Dictionary Model for Bank IBANs

class IBAN: ExpressibleByDictionaryLiteral {
    var ibanDict: [String: String]

    required init(dictionaryLiteral elements: (String, String)...) {
        ibanDict = Dictionary(uniqueKeysWithValues: elements)
    }

    init(ibanDict: [String: String]) {
        self.ibanDict = ibanDict
    }

    var bankName: String {
        return ibanDict.values.first ?? ""
    }

    var ibanNumber: String {
        return ibanDict.keys.first ?? ""
    }
}


