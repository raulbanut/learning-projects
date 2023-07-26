//
//  CoolPeopleViewController.swift
//  testApp
//
//  Created by Banut Raul on 21.07.2023.
//

import UIKit

class CoolPeopleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.view.backgroundColor = .red
        }
    }
}

extension CoolPeopleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "coolPeopleIdentifier", for: indexPath) as? CoolPeopleTableViewCell {
            
            cell.coolImageView.image = UIImage(named: indexPath.row % 2 == 0 ? "Serban" : "Alin")
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }
}
