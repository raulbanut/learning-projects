//
//  ContentOneView.swift
//  Animations
//
//  Created by Raul Banut on 17.11.2022.
//

import SwiftUI

struct ContentOneView: View {
    @State private var isZoomedIn = false
    
    var body: some View {
        VStack(spacing: 0) {
            ImageView(name: "landscape")
                .saturation(self.isZoomedIn ? 1 : 0)
            
            ZStack {
                HStack(spacing: 0) {
                    DescriptionView(
                        title: "Bucegi Trek",
                        caption: "40 km drive followed by an hour long trek",
                        color: .white
                    )
                        .offset(x: 0, y: -15)
                        .padding(.leading, 30)
                        .offset(x: self.isZoomedIn ? 500 : 0, y: -15)
                        .animation(.default, value: isZoomedIn)
                    
                    Spacer()
                }
                
                GeometryReader { geo in
                    Image("thumb")
                        .cornerRadius(self.isZoomedIn ? 40 : 500)
                        .overlay(
                          Circle()
                            .fill(self.isZoomedIn ? Color.clear : Color.red)
                            .scaleEffect(0.6)
                          )
                        .animation(.linear(duration: 4), value: isZoomedIn)
                        .animation(nil, value: isZoomedIn)
                        .saturation(self.isZoomedIn ? 1 : 0)
                        .animation(.linear(duration: 4), value: isZoomedIn)
                        .rotationEffect(self.isZoomedIn ? Angle(degrees: 0) : Angle(degrees: 90))
                        .position(x: self.isZoomedIn ? geo.frame(in: .local).midX : 600, y: 60) /// we use this to get the center of the screen
                        .scaleEffect(self.isZoomedIn ? 1.33 : 0.33)
                        .animation(nil, value: isZoomedIn)
                        .shadow(radius: 10)
//                        .animation(.spring(), value: isZoomedIn)
                        .onTapGesture {
                            isZoomedIn.toggle()
                        }
                }
            }
            .background(Color(red: 0.1, green: 0.1, blue: 0.1))
        }
    }
}

#if DEBUG
struct ContentOneView_Previews: PreviewProvider {
    static var previews: some View {
        ContentOneView()
    }
}
#endif
