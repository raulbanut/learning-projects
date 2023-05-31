//
//  TabBar.swift
//  MoneyTracker
//
//  Created by Banut Raul on 24.05.2023.
//

import Foundation
import UIKit


class TabBar: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = HomeViewController()
        let moreViewController = UIViewController()
        let chartViewController = UIViewController()
        
        homeViewController.tabBarItem = configureTabBarItem(.home)
        moreViewController.tabBarItem = configureTabBarItem(.more)
        chartViewController.tabBarItem = configureTabBarItem(.chart)
        
        self.viewControllers = [homeViewController, chartViewController, moreViewController]
        
        addTopBorderLayer()
//        configureTabBarAppearance()
    }
    
    private func configureTabBarAppearance() {
        let tabBarItemAppearance = UITabBarItemAppearance()
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        tabBarAppearance.backgroundColor = .puertoRico.withAlphaComponent(0.1)
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
    
    private func addTopBorderLayer() {
        let topBorderLayer = CALayer()
        topBorderLayer.frame = CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 1)
        topBorderLayer.backgroundColor = UIColor.puertoRico.withAlphaComponent(0.15).cgColor
        tabBar.layer.addSublayer(topBorderLayer)
    }
    
    func configureTabBarItem(_ item: TabBar.TabBarItem) -> UITabBarItem {
        let customTabBarItem = UITabBarItem()
        customTabBarItem.tag = item.rawValue
        customTabBarItem.title = item.title
        customTabBarItem.image = item.image
        customTabBarItem.selectedImage = item.selectedImage
        
        return customTabBarItem
    }
}

extension TabBar {
    enum TabBarItem: Int {
        case home = 0
        case chart = 1
        case more = 2
        
        var title: String {
            let returnedTitle: String
            switch self {
            case .home: returnedTitle = "Home"
            case .chart: returnedTitle = "Chart"
            case .more: returnedTitle = "More"
            }
            
            return returnedTitle
        }
        
        var image: UIImage? {
            let imageName: String
            switch self {
            case .home: imageName = "house"
            case .chart: imageName = "chart.pie"
            case .more: imageName = "ellipsis"
            }
            
            return UIImage(systemName: imageName)
        }
        
        var selectedImage: UIImage? {
            let imageName: String
            switch self {
            case .home: imageName = "house.fill"
            case .chart: imageName = "chart.pie.fill"
            case .more: imageName = "ellipsis"
            }
            
            return UIImage(systemName: imageName)
        }
    }
}


extension TabBar: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print(tabBarController.viewControllers?.firstIndex(of: viewController))
    }
}
