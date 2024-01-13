//
//  IBANListDetailView.swift
//  IBAN-Saver-App
//
//  Created by Mariam Joglidze on 10.01.24.
//

import SwiftUI

struct IBANListDetailView: ViewControllable {
    
    //MARK: - Properties
    var holder: NavigationStackHolder
    let navigationCoordinator: NavigationCoordinator
    @StateObject var viewModel: IBANListDetailViewModel
    @ObservedObject private var contactViewModel = ContactViewModel.shared
    
    init(holder: NavigationStackHolder, navigationCoordinator: NavigationCoordinator, selectedContact: [Iban]) {
        self.holder = holder
        self.navigationCoordinator = navigationCoordinator
        self._viewModel = StateObject(wrappedValue: IBANListDetailViewModel(selectedContact: selectedContact))
    }
    
    //MARK: - Body
    var body: some View {
        VStack {
            listView
            Spacer()
            Button(action: {
                navigationCoordinator.presentAddIBAN()
            }) {
                Text("Add another IBAN for this person")
            }
        }
    }
    
    //MARK: - View
    private var listView: some View {
        List {
            //            ForEach(contactViewModel.contacts, id: \.ibans) { contact in
            //                DetailView(IBAN: contact.ibans.)
        }
    }
    
    private var addIBANButton: some View {
        Button("Add Another IBAN for this person") {
            navigationCoordinator.presentAddIBAN()
        }
        .padding()
    }
}

//
//#Preview {
//    IBANListDetailView(user: User(username: "მარიამ ჯოგლიძე", ibans: ["GE42TB21212331","BAGAGE22128924843955","BAGAGE22128924843955"]))
//}
