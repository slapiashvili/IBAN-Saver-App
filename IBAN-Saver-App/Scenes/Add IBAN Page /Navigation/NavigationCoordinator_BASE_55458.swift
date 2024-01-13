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
    //MARK: -what functions we will soon have:
//    func navigateToLogin() {
//        guard let viewController = holder.viewController else { return }
//        let view = Login(holder: NavigationStackHolder())
//        viewController.navigationController?.pushViewController(view.viewController, animated: true)
//    }
//    
//    func navigateToRegistration() {
//        guard let viewController = holder.viewController else { return }
//        let view = RegistrationView(holder: NavigationStackHolder())
//        viewController.navigationController?.pushViewController(view.viewController, animated: true)
//    }
//    
//    func navigateToAddIban() {
//        guard let viewController = holder.viewController else { return }
//        let view = AddIban(holder: NavigationStackHolder())
//        viewController.navigationController?.pushViewController(view.viewController, animated: true)
//    }
//    
//    func navigateToLoginView() {
//        guard let viewController = holder.viewController else { return }
//        let view = Login(holder: NavigationStackHolder())
//        viewController.navigationController?.pushViewController(view.viewController, animated: true)
//    }
//    
//    func navigateToMainPageNames() {
//        guard let viewController = holder.viewController else { return }
//        let view = Names(holder: NavigationStackHolder())
//        viewController.navigationController?.pushViewController(view.viewController, animated: true)
//    }
//    
//    func navigateToAddPerson() {
//        guard let viewController = holder.viewController else { return }
//        let view = AddPersonView(holder: NavigationStackHolder())
//        viewController.navigationController?.pushViewController(view.viewController, animated: true)
//    }
//    
//    func navigateToDetails() {
//        guard let viewController = holder.viewController else { return }
//        let view = DetailsPage(holder: NavigationStackHolder())
//        viewController.navigationController?.pushViewController(view.viewController, animated: true)
//    }
//    
//    func presentAddIBAN() {
//      guard let viewController = holder.viewController else { return }
//      let view = AddIBAN(holder: NavigationStackHolder())
//      viewController.present(view.viewController, animated: true)
//    }
//    
//    func navigateToRegistrationView() {
//        guard let viewController = holder.viewController else { return }
//        let view = RegistrationView(holder: NavigationStackHolder())
//        viewController.navigationController?.pushViewController(view.viewController, animated: true)
//    }
//    //
//    func navigateToContentView() {
//        guard let viewController = holder.viewController else { return }
//        let view = ContentView(holder: NavigationStackHolder())
//        viewController.navigationController?.pushViewController(view.viewController, animated: true)
//    }
//    

}
