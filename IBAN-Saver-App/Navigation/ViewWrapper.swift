//
//  ViewWrapper.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 12.01.24.
//

import SwiftUI

public class NavigationStackHolder {
  public weak var viewController: UIViewController?
  
  public init() {}
}

public protocol ViewControllable: View {
  var holder: NavigationStackHolder { get set }
  
  func loadView()
  func viewOnAppear(viewController: UIViewController)
}

public extension ViewControllable {
  var viewController: UIViewController {
    let viewController = HostingController(rootView: self)
    self.holder.viewController = viewController
    return viewController
  }
  
  func loadView() {}
  func viewOnAppear(viewController: UIViewController) {}
}

public class HostingController<ContentView>: UIHostingController<ContentView> where ContentView: ViewControllable {
  public override func loadView() {
    super.loadView()
    self.rootView.loadView()
  }
  
  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.rootView.viewOnAppear(viewController: self)
  }
}
