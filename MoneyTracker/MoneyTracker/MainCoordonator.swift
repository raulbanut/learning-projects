//
//  MainCoordonator.swift
//  MoneyTracker
//
//  Created by Banut Raul on 25.05.2023.
//

import Foundation
import UIKit

class MainCoordinator {
    private let navigationController: UINavigationController
    private let tabBarController = TabBar()
    
    init() {
        self.navigationController = CustomNavigationController(rootViewController: tabBarController)
    }

}

class CustomNavigationController: UINavigationController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
