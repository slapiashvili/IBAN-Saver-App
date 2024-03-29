//
//  OnboardingViewModel.swift
//  IBAN-Saver-App
//
//  Created by Mariam Mchedlidze on 12.01.24.
//

import SwiftUI

class OnboardingViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var currentPage: Int = 0
    @Published var showMainView: Bool = false
    let onboardingData: [OnboardingModel] = OnboardingData.items
    
    // MARK: - Methods
    func skipButtonTapped() {
        withAnimation {
            showMainView = true
        }
    }
    
    func nextButtonTapped() {
        withAnimation {
            if currentPage < 2 {
                currentPage += 1
            } else {
                showMainView = true
            }
        }
    }
    
    func backBuTtonTapped() {
            withAnimation {
                if currentPage > 0 {
                    currentPage -= 1
                }
            }
        }
}
