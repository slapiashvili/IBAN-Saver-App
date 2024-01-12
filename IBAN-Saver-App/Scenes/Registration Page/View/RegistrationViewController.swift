//
//  RegistrationViewController.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 10.01.24.
//

import UIKit
import SwiftUI

class RegistrationViewController: UIViewController {
    
    let regUIView = UIHostingController(rootView: AuthenticationView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHostingView()
    }
    
    // MARK: - Methods
    private func setupHostingView() {
        view.addSubview(regUIView.view)
        regUIView.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            regUIView.view.topAnchor.constraint(equalTo: view.topAnchor),
            regUIView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            regUIView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            regUIView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


//#Preview {
//    RegistrationViewController()
//}
