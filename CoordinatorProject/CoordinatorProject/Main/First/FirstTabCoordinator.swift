//
//  FirstTabCoordinator.swift
//  CoordinatorProject
//
//  Created by Banut Raul on 18.10.2023.
//

import SwiftUI
import UIKit

class FirstTabCoordinator: NSObject, Coordinator {
    
    var rootViewController: UINavigationController
    
    let viewModel = FirstTabViewModel()
    
    override init() {
        self.rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        super.init()
        
        rootViewController.delegate = self
    }
    
    lazy var firstViewController: FirstViewController = {
        let vc = FirstViewController()
        vc.title = "First"
        vc.viewModel = viewModel
        vc.showDetailRequested = { [weak self] in
            self?.goToDetail()
        }
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }
    
    func goToDetail() {
        let detailViewController = UIHostingController(rootView: FirstDetailView(viewModel: viewModel))
        rootViewController.pushViewController(detailViewController, animated: true)
    }
}

extension FirstTabCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController as? UIHostingController<FirstDetailView> != nil {
            print("Detail will be shown")
        } else if viewController as? FirstViewController != nil {
            print("first will be shown")
        }
    }
}
