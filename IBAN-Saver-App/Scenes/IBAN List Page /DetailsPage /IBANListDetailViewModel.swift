//
//  IBANListDetailViewModel.swift
//  IBAN-Saver-App
//
//  Created by Mariam Joglidze on 10.01.24.
//

import Foundation
final class IBANListDetailViewModel: ObservableObject {
    var selectedContact: [Iban]
    
    //MARK: - Init
    init(selectedContact: [Iban]) {
        self.selectedContact = selectedContact
    }
}
