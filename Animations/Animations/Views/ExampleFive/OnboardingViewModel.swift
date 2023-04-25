//
//  OnboardingViewModel..swift
//  Animations
//
//  Created by Raul Banut on 23.11.2022.
//

import Foundation
import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var currentStep = Step.first
    
    func handleNextButtonTap() {
        withAnimation(.spring()) {
            currentStep.next()
        }
    }
    
    func handleBackButtonTap() {
        withAnimation(.spring()) {
            currentStep.back()
        }
    }
}

extension OnboardingViewModel {
    enum Step: Int, CaseIterable {
        case first = 0, second, third
        
        var title: String {
            switch self {
            case .first:
                return "First"
            case .second:
                return "Second"
            case .third:
                return "Third"
            }
        }
        
        mutating func next() {
            switch self {
            case .first:
                self = .second
            case .second:
                self = .third
            case .third:
                return
            }
        }
        
        mutating func back() {
            switch self {
            case .first:
                return
            case .second:
                self = .first
            case .third:
                self = .second
            }
        }
    }
}
