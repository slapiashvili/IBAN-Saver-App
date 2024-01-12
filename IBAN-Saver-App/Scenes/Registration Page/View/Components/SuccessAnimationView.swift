//
//  SuccessAnimationView.swift
//  IBAN-Saver-App
//
//  Created by Davit Natenadze on 12.01.24.
//

import SwiftUI

struct SuccessAnimationView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)
                .background(Color.white)
                .clipShape(Circle())
            
            Text("Success")
                .foregroundStyle(.white)
                .font(.title)
        }
    }
}


