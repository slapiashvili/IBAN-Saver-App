//
//  NavigationCoordinator.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 12.01.24.
//

import SwiftUI

class NavigationCoordinator {
    private let holder: NavigationStackHolder
    
    init(holder: NavigationStackHolder) {
        self.holder = holder
    }
    
    
    func presentAddPersonView() {
        guard let viewController = holder.viewController else { return }
        let view = AddPerson(holder: NavigationStackHolder())
        viewController.present(view.viewController, animated: true)        }
    
    func presentIBANListDetailView(iban: [Iban]) {
        guard let viewController = holder.viewController else { return }
        
        let view = IBANListDetailView(holder: NavigationStackHolder(), navigationCoordinator: self, selectedContact: iban)
        viewController.navigationController?.pushViewController(view.viewController, animated: true)
    }
    
    func presentAddIBAN() {
        guard let viewController = holder.viewController else { return }
        let view = AddIBAN(holder: NavigationStackHolder())
        viewController.present(view.viewController, animated: true)
    }
    
    func navigateToRegistration() {
        guard let viewController = holder.viewController else { return }
        let view = RegistrationView(holder: NavigationStackHolder())
        viewController.navigationController?.pushViewController(view.viewController, animated: true)
    }
    
    func navigateToIbanList(user: User) {
        guard let viewController = holder.viewController else {
            return
        }
        let view = IBANListViewController(holder: NavigationStackHolder(), navigationCoordinator: self, user: user)
        viewController.navigationController?.pushViewController(view.viewController, animated: true)
    }
}

