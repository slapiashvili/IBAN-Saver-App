//
//  IBANListDetailView.swift
//  IBAN-Saver-App
//
//  Created by Mariam Joglidze on 10.01.24.
//

import SwiftUI

struct IBANListDetailView: View {
    //MARK: - Properties
    @StateObject var viewModel: IBANListDetailViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: IBANListDetailViewModel(selectedUser: user))
    }
    
    //MARK: - Body
    var body: some View {
        VStack {
            listView
        }
    }
    
    //MARK: - View
    private var listView: some View {
        List {
            ForEach(viewModel.selectedUser.ibans, id: \.self) { iban in
                DetailView(IBAN: iban)
            }
        }
    }
}

#Preview {
    IBANListDetailView(user: User(username: "მარიამ ჯოგლიძე", ibans: ["GE42TB21212331","BAGAGE22128924843955","BAGAGE22128924843955"]))
}
