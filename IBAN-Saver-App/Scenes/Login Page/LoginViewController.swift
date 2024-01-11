//
//  LoginViewController.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 10.01.24.
//

import UIKit
import SwiftUI


class LoginViewController: UIViewController {
    private var hostingController: UIHostingController<LogInView>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHostingController()
        addConstraints()
    }
    
    private func setupHostingController() {
        let logInView = LogInView()
        hostingController = UIHostingController(rootView: logInView)
        
        addChild(hostingController!)
        view.addSubview(hostingController!.view)
        hostingController!.didMove(toParent: self)
        hostingController!.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addConstraints () {
        guard let hostingController = hostingController else {
            return
        }
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

