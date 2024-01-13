//
//  LogInView.swift
//  IBAN-Saver-App
//
//  Created by Mariam Mchedlidze on 10.01.24.
//

import SwiftUI
import FirebaseAuth

struct LogInView: ViewControllable {
    
    // MARK: - Properties
    
    var holder: NavigationStackHolder
    let navigationCoordinator: NavigationCoordinator
    
    @State private var emailInput: String = ""
    @State private var passwordInput: String = ""
    @State private var viewModel = LoginViewModel()

    init(holder: NavigationStackHolder) {
        self.holder = holder
        self.navigationCoordinator = NavigationCoordinator(holder: holder)
    }
    
    var body: some View {
        ZStack {
            CustomBackground()
            LogInContentView(emailInput: $emailInput, passwordInput: $passwordInput, viewModel: viewModel, navigationCoordinator: navigationCoordinator)
        }
        .navigationBarBackButtonHidden()
    }
}






