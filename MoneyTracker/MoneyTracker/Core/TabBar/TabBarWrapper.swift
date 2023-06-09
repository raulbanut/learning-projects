//
//  TabBarWrapper.swift
//  MoneyTracker
//
//  Created by Banut Raul on 24.05.2023.
//

import Foundation
import SwiftUI

struct TabBarWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let tabBarController = TabBar()
        
        tabBarController.tabBar.tintColor = .puertoRico
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.unselectedItemTintColor = .gray.withAlphaComponent(0.5)
        
        return tabBarController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
