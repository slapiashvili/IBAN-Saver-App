//
//  IBANListDetailView.swift
//  IBAN-Saver-App
//
//  Created by Mariam Joglidze on 10.01.24.
//

import SwiftUI

struct IBANListDetailView: ViewControllable {

    var holder: NavigationStackHolder
    let navigationCoordinator: NavigationCoordinator
        
        //MARK: - Properties
        @StateObject var viewModel: IBANListDetailViewModel
        
        init(holder: NavigationStackHolder, navigationCoordinator: NavigationCoordinator, user: RegUser) {
            self.holder = holder
            self.navigationCoordinator = navigationCoordinator
            self._viewModel = StateObject(wrappedValue: IBANListDetailViewModel(selectedUser: user))
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
//            ForEach(viewModel.selectedUser.ibans, id: \.self) { iban in
//                DetailView(IBAN: iban)
//            }
        }
    }
    
    private var addIBANButton: some View {
            Button("Add Another IBAN for this person") {
                navigationCoordinator.presentAddIBAN()
            }
            .padding()
        }
}

//#Preview {
//    IBANListDetailView(user: User(username: "მარიამ ჯოგლიძე", ibans: ["GE42TB21212331","BAGAGE22128924843955","BAGAGE22128924843955"]))
//}
