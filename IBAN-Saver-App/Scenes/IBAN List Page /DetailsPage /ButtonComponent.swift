//
//  ButtonComponent.swift
//  IBAN-Saver-App
//
//  Created by Mariam Joglidze on 10.01.24.
//

import SwiftUI

struct ButtonComponent: View {
    var buttonTitle: String
    var action: () -> Void // Closure to handle button action

    var body: some View {
        
        ButtonView
    }
    
    private var ButtonView: some View {
        Button(action: {
            action()
        }) {
            Text(buttonTitle)
                .frame(width: 50, height: 10)
                .padding()
                .background(.black)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

//#Preview {
//    ButtonComponent(buttonTitle: "Copy", action: (print) -> Void)
//}
