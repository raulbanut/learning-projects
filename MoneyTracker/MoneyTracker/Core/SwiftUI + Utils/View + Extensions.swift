//
//  View + Extensions.swift
//  MoneyTracker
//
//  Created by Banut Raul on 06.06.2023.
//

import Foundation
import SwiftUI

extension View {
    
    func primaryBackground() -> some View {
        background(Color.puertoRico.ignoresSafeArea(.container, edges: .vertical))
    }
    
    func secondaryBackground(opacity: Double = 0.5) -> some View {
        background(Color.puertoRico.opacity(opacity).ignoresSafeArea(.container, edges: .vertical))
    }
}
