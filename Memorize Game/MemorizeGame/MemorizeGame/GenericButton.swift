//
//  GenericButton.swift
//  MemorizeGame
//
//  Created by Raul Banut on 10.04.2023.
//

import Foundation
import SwiftUI

struct GenericButton<Content: View>: View {
    let type: ButtonStyles
    let action: () -> Void
    let label: () -> Content
    
    enum ButtonStyles {
        case filled
        case outlined
        case plain
    }
    
    //  MARK: Inits
    init(type: ButtonStyles, action: @escaping () -> Void, label: @escaping () -> Content) {
        self.type = type
        self.action = action
        self.label = label
    }
    
    init(action: @escaping () -> Void, @ViewBuilder label: @escaping () -> Content) {
        self.init(type: .plain, action: action, label: label)
    }
    
    init(type: ButtonStyles, action: @escaping () -> Void, title: String) where Content == Text {
        self.init(type: type, action: action, label: { Text(title) })
    }
    
    init(action: @escaping () -> Void, title: String) where Content == Text {
        self.init(type: .plain, action: action, label: { Text(title) })
    }
    
    
    var body: some View {
        switch type {
        case .filled:
            Button(action: self.action, label: self.label).buttonStyle(FilledButtonStyle())
        case .outlined:
            Button(action: self.action, label: self.label).buttonStyle(OutlinedButtonStyle())
        case .plain:
            Button(action: self.action, label: self.label).buttonStyle(PlainButtonStyle())
        }
    }
}

struct FilledButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: 108, maxHeight: 34, alignment: .center)
            .contentShape(Rectangle())
            .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : Color.black)
            .background(configuration.isPressed ? Color(.red).opacity(0.5) : Color(.red))
            .cornerRadius(20)
            
    }
}
struct OutlinedButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: 108, maxHeight: 34, alignment: .center)
            .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : Color(.gray))
            .background(Color.white.opacity(0))
            .overlay(RoundedRectangle(cornerRadius:10).stroke(Color(.gray), lineWidth: 2))
    }
}

struct PlainButtonStyle: ButtonStyle {
    var color: Color = .blue
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: 100, maxHeight: 34, alignment: .center)
            .foregroundColor(configuration.isPressed ? color.opacity(0.4) : color)
    }
}
