//
//  ContentFourView.swift
//  Animations
//
//  Created by Raul Banut on 22.11.2022.
//

import SwiftUI

/// To generate timing curve you can use https://cubic-bezier.com/
/// https://www.objc.io/blog/2019/09/26/swiftui-animation-timing-curves/

struct ContentFourView: View {
    @State private var width: CGFloat = 0
    
    private let height: CGFloat = 24
    private let duration: Double = 4
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                createButton(text: "increase +") {
                    withAnimation(.linear(duration: duration)) {
                        width += 100
                    }
                }
                
                createButton(text: "decrease -") {
                    withAnimation(.linear(duration: duration)) {
                        width -= 100
                    }
                }
            }
            
            VStack(spacing: 8) {
                VStack(spacing: 0){
                    createRectangle(text: "default")
                        .transaction { view in
                            view.animation = .default.repeatForever()
                        }
                    
                    createRectangle(text: "linear")
                    
                    createRectangle(text: "linear")
                        .animation(.timingCurve(0.05, 1.9, 0.7, -0.77, duration: duration), value: width)
                    
                    createRectangle(text: "timingCurve")
                        .transaction { view in
                            view.animation = .timingCurve(0.05, 1.9, 0.7, -0.77, duration: duration)
                        }
                    
                    createRectangle(text: "nil")
                        .transaction { redView in
                            redView.animation = nil
                        }
                }
                
                VStack(spacing: 0) {
                    createRectangle(text: "easeInOut")
                        .transaction { redView in
                            redView.animation = .easeInOut(duration: duration)
                        }
                    
                    createRectangle(text: "easeIn")
                        .transaction { view in
                            view.animation = .easeIn(duration: duration)
                        }
                    
                    createRectangle(text: "easeOut")
                        .transaction { view in
                            view.animation = .easeOut(duration: duration)
                        }
                }
                
                VStack(spacing: 0) {
                    createRectangle(text: "spring")
                        .transaction { view in
                            view.animation = .spring(response: duration, dampingFraction: 0.8, blendDuration: 1)
                        }
                    
                    createRectangle(text: "interactiveSpring")
                        .transaction { view in
                            view.animation = .interactiveSpring(response: duration, dampingFraction: 0.5)
                        }
                    
                    createRectangle(text: "nil")
//                        .animation(.default, value: width)
//                        .transaction { redView in
//                            redView.animation = nil
//                        }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
    
    func createRectangle(text: String) -> some View {
        Rectangle()
            .fill(Color.red)
            .border(.black)
            .frame(width: 120 + width, height: height)
            .overlay(content: {
                Text(text)
                    .bold()
                    .foregroundColor(.black)
            })
    }
    
    func createButton(text: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundColor(.white)
                .bold()
        }
        .frame(width: 100, height: 30)
        .background(.black)
    }
    
    
}

#if DEBUG
struct ContentFour_Previews: PreviewProvider {
    static var previews: some View {
        ContentFourView()
    }
}
#endif
