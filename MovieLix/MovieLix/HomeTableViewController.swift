//
//  HomeTableViewController.swift
//  MovieLix
//
//  Created by Banut Raul on 25.07.2023.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var store: Store!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return MovieType.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return MovieType(rawValue: section)?.title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCellIdentifier", for: indexPath) as? SectionTableViewCell {
            switch indexPath.section {
            case 0:
                cell.sectionDataSource = store.comedyList
            case 1:
                cell.sectionDataSource = store.romanceList
            case 2:
                cell.sectionDataSource = store.actionList
            case 3:
                cell.sectionDataSource = store.dramaList
            default: break
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        220
    }
}
