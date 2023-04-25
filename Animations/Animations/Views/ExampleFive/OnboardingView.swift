//
//  OnboardingView.swift
//  Animations
//
//  Created by Raul Banut on 23.11.2022.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel = OnboardingViewModel()
    
    @Namespace private var onboardingNamespace
    
    var body: some View {
        ZStack {
            switch viewModel.currentStep {
            case .first:
                OnboardingFirstView(onboardingNamespace: onboardingNamespace)
            case .second:
                OnboardingSecondView(onboardingNamespace: onboardingNamespace)
            case .third:
                OnboardingFirstView(onboardingNamespace: onboardingNamespace)
            }
            
            VStack {
                Spacer()
                
                HStack(spacing: 8) {
                    Button {
                        viewModel.handleBackButtonTap()
                    } label: {
                        Text("Back")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .frame(width: 100, height: 30)
                    .background(.black)
                    .padding(.bottom)
                    
                    Button {
                        viewModel.handleNextButtonTap()
                    } label: {
                        Text("Next")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .frame(width: 100, height: 30)
                    .background(.black)
                    .padding(.bottom)
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
