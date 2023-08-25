//
//  ViewController.swift
//  PlayWithSwiftUIAndUIKit
//
//  Created by Banut Raul on 29.07.2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let button = UIButton()
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Navigate to SwiftUI Screen", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openSwiftUIScreen), for: .touchUpInside)
        button.titleLabel?.font = .boldSystemFont(ofSize: 21)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    @objc func openSwiftUIScreen () {
        let swiftUIController = UIHostingController(rootView: SwiftUIView())
        self.navigationController?.pushViewController(swiftUIController, animated: true)
    }
}


