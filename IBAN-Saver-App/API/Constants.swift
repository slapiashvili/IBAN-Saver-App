//
//  Constants.swift
//  IBAN-Saver-App
//
//  Created by Davit Natenadze on 12.01.24.
//

import Firebase
import FirebaseStorage

let DB_REF = Database.database().reference()

let REF_USERS = DB_REF.child("users")

let REF_IBANS = DB_REF.child("ibans")

let REF_USER_CONTACTS = DB_REF.child("user-contacts")
