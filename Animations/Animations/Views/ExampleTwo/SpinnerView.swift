//
//  SpinnerView.swift
//  Animations
//
//  Created by Raul Banut on 19.11.2022.
//

import SwiftUI

struct SpinnerView: View {
    @State private var currentIndex: Int?
    @State private var completed = false
    @State private var isVisible = false
    @State private var currentOffset = CGSize.zero
    
    let leavesCount = 12
    
    let shootUp = AnyTransition
        .offset(CGSize(width: 0, height: -1000))
    
    var body: some View {
        VStack {
            ZStack {
                if isVisible {
                    ForEach(0..<leavesCount) { index in
                        Leaf(
                            rotation: Angle(
                                degrees: (Double(index) / Double(self.leavesCount)) * 360.0
                            ),
                            isCurrent: index == currentIndex,
                            isCompleting: self.completed
                        )
                    }
                    .transition(shootUp)
                }
                
                if isVisible {
                    Text("Loading...")
                        .transition(.move(edge: .trailing))
                        .transition(.scale.animation(.linear))
                        .animation(.default)
                }
                
            }
            .animation(.easeIn(duration: 1.0))
            .onAppear(perform: animate)
            
            .offset(currentOffset)
            .blur(radius: currentOffset == .zero ? 0 : 10)
            
            .gesture( /// we can add gesture that change
                DragGesture()
                    .onChanged { gesture in
                        self.currentOffset = gesture.translation
                    }
                    .onEnded { gesture in
                        if self.currentOffset.height > 150 {
                            self.complete()
                        }
                        self.currentOffset = .zero
                    }
            )
        }
    
    }
    
    func animate() {
        var iteration = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isVisible = true
        }
        
        Timer.scheduledTimer(
            withTimeInterval: 0.15,
            repeats: true) { timer in
                if let current = self.currentIndex {
                    self.currentIndex = (current + 1) % self.leavesCount
                } else {
                    self.currentIndex = 0
                }
                
                iteration += 1
                if iteration == 30 {
                    timer.invalidate()
                    self.complete()
                }
            }
    }
    
    func complete() {
        guard !completed else { return }
        
        completed = true
        currentIndex = nil
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isVisible = false
        }
    }
}

extension SpinnerView {
    struct Leaf: View {
        let rotation: Angle
        let isCurrent: Bool
        let isCompleting: Bool
        
        var body: some View {
            Capsule()
                .stroke(isCurrent ? Color.white : Color.gray, lineWidth: 8)
                .frame(width: 20, height: isCompleting ? 20 : 50)
                .offset(x: 0, y: 70)
                .rotationEffect(rotation)
                .scaleEffect(isCurrent ? 0.5 : 1.0)
                .animation(.easeInOut(duration: 1.5), value: isCurrent)
        }
    }
}

#if DEBUG
struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
#endif
