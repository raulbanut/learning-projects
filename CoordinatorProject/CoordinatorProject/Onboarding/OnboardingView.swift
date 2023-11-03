//
//  OnboardingView.swift
//  CoordinatorProject
//
//  Created by Banut Raul on 18.10.2023.
//

import SwiftUI

struct OnboardingView: View {
    
    let doneButtonTapped: () -> ()
    
    var body: some View {
        VStack {
            TabView {
                ScalledImageView(name: "tara1")
                    .tag(0)
                ScalledImageView(name: "tara2")
                    .tag(1)
                
                Button("Done") {
                    doneButtonTapped()
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
        .background(.black)
    }
}

#Preview {
    OnboardingView(doneButtonTapped: {})
}
