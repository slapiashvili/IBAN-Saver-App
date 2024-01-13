//
//  IBANListDetailViewModel.swift
//  IBAN-Saver-App
//
//  Created by Mariam Joglidze on 10.01.24.
//

import Foundation
final class IBANListDetailViewModel: ObservableObject {
     var selectedUser: RegUser
    
    //MARK: - Init
    init(selectedUser: RegUser) {
        self.selectedUser = selectedUser
    }
}
