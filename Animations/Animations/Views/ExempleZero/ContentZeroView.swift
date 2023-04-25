//
//  ContentZeroView.swift
//  Animations
//
//  Created by Raul Banut on 17.11.2022.
//

import SwiftUI

struct CircleView: View {
    let color: Color
    
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundColor(color)
            .animation(Animation.easeOut(duration: 3), value: color)
    }
}

let colors: [Color] = [
    Color.green,
    Color.blue,
    Color.red,
    Color.orange,
    Color.pink,
    Color.purple
]

struct ContentZeroView: View {
    @State private var currentOffset = 0
    
    var body: some View {
        VStack {
            Button {
                addOneToOffset()
            } label: {
                Text("Press me")
                    .foregroundColor(.blue)
            }
            
            CircleView(color: colors.randomElement()!)
                .offset(
                    x: offsets[currentOffset].x,
                    y: offsets[currentOffset].y
                )
                .animation(.linear(duration: 0), value: currentOffset)
        }
    }
    
    func addOneToOffset()  {
        self.currentOffset += 1
        if currentOffset == offsets.count {
            currentOffset = 0
        }
    }
    
    let offsets: [CGPoint] = [
        CGPoint(x: 0, y: 0),
        CGPoint(x: 100, y: 0),
        CGPoint(x: 100, y: -100),
        CGPoint(x: -100, y: -100),
        CGPoint(x: -100, y: 0),
        CGPoint(x: 0, y: 0)
    ]

    
}

#if DEBUG
struct ContentZeroView_Previews: PreviewProvider {
    static var previews: some View {
        ContentZeroView()
    }
}
#endif
