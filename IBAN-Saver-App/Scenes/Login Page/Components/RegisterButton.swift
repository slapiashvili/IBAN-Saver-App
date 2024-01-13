//
//  RegisterButton.swift
//  IBAN-Saver-App
//
//  Created by Mariam Mchedlidze on 13.01.24.
//

import SwiftUI

struct RegisterButton: View {
    
    // MARK: - Properties
    let navigationCoordinator: NavigationCoordinator
    
    var body: some View {
        HStack (spacing: 8) {
            Text("Don't have an account?")
                .secondaryTextStyle
            
            Button(action: {
                navigationCoordinator.navigateToRegistration()
            }) {
                Text("Register")
                    .font(.system(size: 16))
            }
        } .padding(.bottom, 12)
    }
}
