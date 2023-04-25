//
//  OnboardingFirstView.swift
//  Animations
//
//  Created by Raul Banut on 23.11.2022.
//

import SwiftUI

struct OnboardingFirstView: View {
    
    @EnvironmentObject var viewModel: OnboardingViewModel
    
    var onboardingNamespace: Namespace.ID
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Image("thumb")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .padding(.top, 120)
                
                VStack {
                    Image(systemName: "figure.run")
                        .resizable()
                        .background(.red)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .padding(.top, 120)
                        .matchedGeometryEffect(
                            id: "human",
                            in: onboardingNamespace,
                            properties: .frame
                        )
                    
                    Image("thumb")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .padding(.top, 120)
                        .matchedGeometryEffect(
                            id: "animal",
                            in: onboardingNamespace
                        )
                }
            }
                
            Spacer()
        }
    }
}

struct OnboardingFirstView_Previews: PreviewProvider {
    @Namespace private static var onboardingNamespace
    
    static var previews: some View {
        OnboardingFirstView(onboardingNamespace: onboardingNamespace)
    }
}
