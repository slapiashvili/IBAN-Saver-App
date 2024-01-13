//
//  TextModifier.swift
//  IBAN-Saver-App
//
//  Created by Davit Natenadze on 11.01.24.
//

import SwiftUI

enum TextModifier: ViewModifier {
    case primary
    case header
    
    func body(content: Content) -> some View {
        switch self {
        case .primary:
            content
                .font(.headline)
                .foregroundColor(.ibanText)
        case .header:
            content
                .font(.title)
                .foregroundColor(.ibanHeader)
        }
    }
}
