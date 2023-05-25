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
        
        tabBarController.tabBar.tintColor = .black
        
        return tabBarController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
