//
//  Button.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 11.01.24.
//

import SwiftUI

extension Button {
    // MARK: - PrimaryButton
    var primaryButton: some View {
        self
            .padding(.vertical, 16)
            .frame(minWidth: 0, maxWidth: 248)
            .background(Color.ibanButton)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(Color.ibanBackground)
            .cornerRadius(16)
    }
    
    // MARK: - AddButton
    var addButton: some View {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundColor(Color.ibanButton)
        }
    
    // MARK: - SecondaryButton
    var secondaryButton: some View {
        self
            .imageScale(.large)
            .frame(width: 20, height: 20)
            .foregroundColor(Color.gray)
    }
}
