//
//  AppDelegate.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 10.01.24.Target 'IBAN-Saver-App' (project 'IBAN-Saver-App') has copy command from '/Downloads/GoogleService-Info.plist' to '/Users/mariamjoglidze/Library/Developer/Xcode/DerivedData/IBAN-Saver-App-duqpsobswdlizwedtlkibushigvr/Build/Products/Debug-iphonesimulator/IBAN-Saver-App.app/GoogleService-Info.plist'
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }

}

