//
//  OnboardingView.swift
//  IBAN-Saver-App
//
//  Created by Mariam Mchedlidze on 11.01.24.
//
import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        ZStack {
            CustomBackground()
            VStack {
                if !viewModel.showMainView {
                    SkipButton(showMainView: $viewModel.showMainView, viewModel: viewModel)
                    
                    OnboardingImage(imageName: viewModel.onboardingData[viewModel.currentPage].imageName)
                        .padding(.top, 24)
                    
                    OnboardingContentView(currentPage: $viewModel.currentPage, onboardingData: viewModel.onboardingData)
                    
                    NextButton(currentPage: $viewModel.currentPage, showMainView: $viewModel.showMainView, viewModel: viewModel)
                        .padding(.top, 12)
                }
                Spacer()
            }
            
            if viewModel.showMainView {
                LogInView()
                    .transition(.opacity)
            }
        }
    }
}

//MARK: - Image

struct OnboardingImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 350, height: 400)
            .scaledToFit()
    }
}

//MARK: - Content

struct OnboardingContentView: View {
    @Binding var currentPage: Int
    let onboardingData: [OnboardingModel]
    
    var body: some View {
        VStack {
            Text(onboardingData[currentPage].text)
                .primaryTextStyle
                .padding(.horizontal,24)
            
            HStack(spacing: 12) {
                ForEach(0..<3) { index in
                    Circle()
                        .fill(index == currentPage ? Color.gray : Color.gray.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.top, 20)
        }
    }
}

// MARK: - Skip Button

struct SkipButton: View {
    @Binding var showMainView: Bool
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        Button(action: {
                viewModel.skipButtonTapped()
        }) {
            Spacer()
            Text("Skip")
                .primaryTextStyle
                .foregroundColor(.gray)
                .padding(.trailing, 24)
        }
        .padding(.top, 60)
    }
}

// MARK: - Next Button

struct NextButton: View {
    @Binding var currentPage: Int
    @Binding var showMainView: Bool
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        Button(action: {
            viewModel.nextButtonTapped()
        }) {
            Text(currentPage < 2 ? "Next" : "Get Started")
        }
    }
}

//MARK: - Preview
struct OnboardingViewPreviews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: OnboardingViewModel())
    }
}
