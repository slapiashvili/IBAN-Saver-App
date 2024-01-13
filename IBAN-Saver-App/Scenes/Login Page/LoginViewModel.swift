//
//  LoginViewModel.swift
//  IBAN-Saver-App
//
//  Created by Mariam Mchedlidze on 13.01.24.
//

import SwiftUI
import FirebaseAuth

final class LoginViewModel: ObservableObject {

    
    init() {

    }
    
    func login(email: String, password: String, completion: @escaping (User) -> Void) {
        ApiManager.loginUser(email: email, password: password) { user in
          completion(user)
        }
    }
}
