//
//  OnboardingCoordinator.swift
//  CoordinatorProject
//
//  Created by Banut Raul on 18.10.2023.
//

import SwiftUI
import Combine

class OnboardingCoordinator: Coordinator {
    
    var rootViewController = UIViewController()
    
    var hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    
    init(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) {
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    
    func start() {
        let view = OnboardingView { [weak self] in
            self?.hasSeenOnboarding.send(true)
        }
        rootViewController  = UIHostingController(rootView: view)
    }
}
