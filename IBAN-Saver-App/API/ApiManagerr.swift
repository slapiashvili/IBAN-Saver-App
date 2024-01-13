//
//  AddIbanToUser.swift
//  IBAN-Saver-App
//
//  Created by Davit Natenadze on 12.01.24.
//

import Foundation
import Firebase
import FirebaseAuth


struct Iban1 {
    let name: String
    let surname: String
    let ibanNumber: String
    let bankName: String
}

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
    
    static func loginUser(email: String, password: String, completion: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    onFailure(error)
                    return
                }


            fetchUserData() { user in
                completion(user)
            }
        }
    
    static func fetchUserData(completion: @escaping (User) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print("no uid")
            return
        }
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot, _  in
            guard let userData = snapshot.value as? [String: Any] else {
                print("DEBUG: Error fetching user data")
                return
            }
            
            var contacts: [Contact] = []
            
            if let contactData = userData["contacts"] as? [[String: Any]] {
                for contact in contactData {
                    let contact = Contact(dictionary: contact)
                    contacts.append(contact)
                }
            }
        
            let user = User(uid: uid, dictionary: userData, contacts: contacts)
            print(user.username)
            print(user.email)
            completion(user)
        }
    }
    
    // MARK: - New Era
    
    
    static func addContactToUser(contact: Contact) {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("no uid")
            return
        }

        let newContact: [String : Any] = [
            "name": contact.name,
            "surname": contact.surname,
            "ibans": contact.ibans.map { iban in
                ["ibanNumber": iban.ibanNumber, "bankName": iban.bankName]
            }
        ]

        let contactKey = contact.name.lowercased()

        let updatedContacts = ["contacts/\(contactKey)": newContact]

        REF_USERS.child(uid).updateChildValues(updatedContacts) { error, ref in
            if let error {
                print("Error updating contacts: \(error.localizedDescription)")
                return
            }
            print("Successfully updated contacts")
        }
    }


    
    // MARK: - fetch contacts
    
    static func fetchUserContacts(completion: @escaping ([Contact]) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("no uid")
            return
        }

        REF_USERS.child(uid).child("contacts").observeSingleEvent(of: .value) { snapshot in
            var contacts: [Contact] = []

            if let contactsDict = snapshot.value as? [String: [String: Any]] {
                for (_, contactData) in contactsDict {
                    if let name = contactData["name"] as? String,
                       let surname = contactData["surname"] as? String,
                       let ibansData = contactData["ibans"] as? [[String: Any]] {

                        var ibans: [Iban] = []
                        for ibanData in ibansData {
                            if let ibanNumber = ibanData["ibanNumber"] as? String,
                               let bankName = ibanData["bankName"] as? String {
                                let iban = Iban(ibanNumber: ibanNumber, bankName: bankName)
                                ibans.append(iban)
                            }
                        }

                        let contact = Contact(name: name, surname: surname, ibans: ibans)
                        contacts.append(contact)
                    }
                }
            }

            print("contacts count is: \(contacts.count)")
            for asd in contacts {
                print(asd.name)
            }
            completion(contacts)
        }
    }

    
    
    
    
    
    
    
    
    
//    static func addIbanToUser(iban: Iban) {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//
//        let newIban = [
//            "ibanNumber": iban.ibanNumber,
//            "bankName": iban.bankName
//        ]
//
//        REF_USERS.child(uid).child("contacts").child("ibans").observeSingleEvent(of: .value) { snapshot in
//            var ibansArray: [[String: Any]] = []
//
//            if let existingIbans = snapshot.value as? [[String: Any]] {
//                ibansArray = existingIbans
//            }
//
//            ibansArray.append(newIban)
//
//            let updatedIbans = ["ibans": ibansArray]
//
//            REF_USERS.child(uid).updateChildValues(updatedIbans) { error, ref in
//                if let error  {
//                    print("DEBUG Error updating IBANs: \(error.localizedDescription)")
//                    return
//                }
//                print("Successfully updated IBANs")
//            }
//        }
//    }
    
    static func signOut() {
        do {
           try Auth.auth().signOut()
        }catch {
            print("erros sign out")
        }
    }
    
    
 

}
