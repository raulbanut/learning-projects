//
//  SecondTabCoordinator.swift
//  CoordinatorProject
//
//  Created by Banut Raul on 18.10.2023.
//

import Foundation
import UIKit

class SecondTabCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    
    lazy var secondViewController: SecondViewController = {
        let vc = SecondViewController()
        vc.title = "Second"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}
