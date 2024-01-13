//
//  Alert.swift
//  IBAN-Saver-App
//
//  Created by Mariam Mchedlidze on 13.01.24.
//

import SwiftUI

// MARK: - Alert

extension View {
    func showAlert(title: String, message: String) -> some View {
        self.alert(isPresented: .constant(true)) {
            Alert(title: Text(title), message: Text(message), dismissButton: .default(Text("OK")))
        }
    }
}
