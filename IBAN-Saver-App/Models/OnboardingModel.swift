//
//  OnboardingModel.swift
//  IBAN-Saver-App
//
//  Created by Mariam Mchedlidze on 12.01.24.
//


struct OnboardingModel {
    let text: String
    let imageName: String
}

struct OnboardingData {
    static let items: [OnboardingModel] = [
        OnboardingModel(
            text: "Welcome to your go-to IBAN saving app. Effortlessly manage your savings and watch your money grow.",
            imageName: "image1"
        ),
        OnboardingModel(
            text: "Securely set up your account. Fill in your name, email, and password to get started",
            imageName: "image2"
        ),
        OnboardingModel(
            text: "Get familiar with your dashboard—the hub for managing your savings and goals. Swipe left to explore",
            imageName: "image3"
        )
    ]
}
