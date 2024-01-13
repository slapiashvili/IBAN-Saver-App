//
//  LoginViewModel.swift
//  IBAN-Saver-App
//
//  Created by Mariam Mchedlidze on 13.01.24.
//

import SwiftUI
import FirebaseAuth

struct LoginViewModel {
    func login(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            completion(error)
        }
    }
}
