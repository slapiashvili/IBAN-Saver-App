//
//  IBANListDetailViewModel.swift
//  IBAN-Saver-App
//
//  Created by Mariam Joglidze on 10.01.24.
//

import Foundation
final class IBANListDetailViewModel: ObservableObject {
     var selectedUser: User
    
    //MARK: - Init
    init(selectedUser: User) {
        self.selectedUser = selectedUser
    }
}
