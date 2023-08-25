//
//  SwiftUIView.swift
//  PlayWithSwiftUIAndUIKit
//
//  Created by Banut Raul on 29.07.2023.
//

import SwiftUI

struct SwiftUIView: View {
    @State var size: CGSize = .zero
    
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: 0) {
                Spacer()
                createRectangle(color: .blue)
                    .padding(.init(top: 20, leading: 0, bottom: 40, trailing: 0))
                    .onAppear {
                        size = proxy.size
                    }
                Spacer()
                createRectangle(color: .green)
                    .frame(height: size.height / 2)
                Spacer()
            }
        }
        
    }
    
    func createRectangle(color: Color) -> some View {
        return Rectangle()
            .frame(width: width / 5)
            .foregroundColor(color)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
