//
//  PasswordCriteriaView.swift
//  IBAN-Saver-App
//
//  Created by Davit Natenadze on 12.01.24.
//

import SwiftUI

struct PasswordCriteriaView: View {
    
    // MARK: - Properties
    var text: String
    var isCriteriaMet: Bool = false
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: isCriteriaMet ? "checkmark.circle" : "xmark.circle")
                .foregroundStyle(isCriteriaMet ? .green : .red)
            
            Text(text)
                .foregroundColor(.secondary)
        }
        .font(.title3)
    }
    
}


#Preview {
    PasswordCriteriaView(text: "asd1")
}
