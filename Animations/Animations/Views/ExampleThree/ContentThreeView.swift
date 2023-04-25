//
//  ContentThreeView.swift
//  Animations
//
//  Created by Raul Banut on 21.11.2022.
//

import SwiftUI

struct ContentThreeView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(.spring(response: 4, dampingFraction: 0.4)), in: 1...10) /// SwiftUI compares the state of the button before and then applies the modifications.
            
            Spacer()
            
            Button {
                animationAmount += 1.0
            } label: {
                Text("Press me!")
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
            .animation(nil, value: animationAmount)
            .onChange(of: animationAmount) { newValue in
                print(newValue)
            }
        }
    }
}

#if DEBUG
struct ContentThreeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentThreeView()
    }
}
#endif
