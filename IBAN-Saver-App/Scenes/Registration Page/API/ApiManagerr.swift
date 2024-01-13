//
//  AddIbanToUser.swift
//  IBAN-Saver-App
//
//  Created by Davit Natenadze on 12.01.24.
//

import Foundation
import Firebase


class ApiManager {
    
    static func registerUser(email: String, username: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error {
                print("DEBUG Error is \(error.localizedDescription)")
                completion(false)
                return
            }
            
            
            guard let uid = result?.user.uid else { return }
            
            let values = ["email": email, "username": username]
            
            REF_USERS.child(uid).updateChildValues(values) { error, ref in
                print("Successfully updated user info")
                completion(true)
            }

        }
        
    }
    
    static func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG Error is \(error.localizedDescription)")
                return
            }

            guard let uid = result?.user.uid else { return }

            fetchUserData(withUid: uid) { user in
                if let user {
                    print("User name: \(user.email) and ibans count \(user.ibans.count)")
                } else {
                    print("Failed to fetch user data")
                }
            }
        }
    }
    
    static func fetchUserData(withUid uid: String, completion: @escaping (RegUser?) -> Void) {
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot, _  in
            guard let userData = snapshot.value as? [String: Any] else {
                completion(nil)
                return
            }
            
            var ibans: [IBANStruct] = []

            let email = userData["email"] as? String ?? ""
            let username = userData["username"] as? String ?? ""

            if let ibansData = userData["ibans"] as? [[String: Any]] {
                for ibanData in ibansData {
                    let name = ibanData["name"] as? String ?? ""
                    let surname = ibanData["surname"] as? String ?? ""
                    let ibanNumber = ibanData["ibanNumber"] as? String ?? ""
                    let bankName = ibanData["bankName"] as? String ?? ""
                    let iban = IBANStruct(name: name, surname: surname, ibanNumber: ibanNumber, bankName: bankName)
                    ibans.append(iban)
                }
            }

            let user = RegUser(name: email, username: username, ibans: ibans)
            print(user)
            completion(user)
        }
    }
    
    static func addIbanToUser(iban: IBANStruct) {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        let newIban = [
            "name": iban.name,
            "surname": iban.surname,
            "ibanNumber": iban.ibanNumber,
            "bankName": iban.bankName
        ]

        REF_USERS.child(uid).child("ibans").observeSingleEvent(of: .value) { snapshot in
            var ibansArray: [[String: Any]] = []

            if let existingIbans = snapshot.value as? [[String: Any]] {
                ibansArray = existingIbans
            }

            ibansArray.append(newIban)

            let updatedIbans = ["ibans": ibansArray]

            REF_USERS.child(uid).updateChildValues(updatedIbans) { error, ref in
                if let error = error {
                    print("DEBUG Error updating IBANs: \(error.localizedDescription)")
                    return
                }
                print("Successfully updated IBANs")
            }
        }
    }

    
    static func fetchLoggedInUserData() {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot, _  in
            guard let userData = snapshot.value as? [String: Any] else {
                return
            }
            
            var ibans: [IBANStruct] = []

            let email = userData["email"] as? String ?? ""
            let username = userData["username"] as? String ?? ""

            if let ibansData = userData["ibans"] as? [[String: Any]] {
                for ibanData in ibansData {
                    let name = ibanData["name"] as? String ?? ""
                    let surname = ibanData["surname"] as? String ?? ""
                    let ibanNumber = ibanData["ibanNumber"] as? String ?? ""
                    let bankName = ibanData["bankName"] as? String ?? ""
                    let iban = IBANStruct(name: name, surname: surname, ibanNumber: ibanNumber, bankName: bankName)
                    ibans.append(iban)
                }
            }

            let user = RegUser(name: email, username: username, ibans: ibans)
            print(user.email)
            print(user.username)
            print(user.ibans.count)
        }
    }
}
