//
//  ItemsViewController.swift
//  LootLogger
//
//  Created by Banut Raul on 17.07.2023.
//

import Foundation
import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    enum SectionType: Int, CaseIterable {
        case itemsOver50
        case itemsUnder50
        
        var title: String {
            switch self {
            case .itemsOver50:
                return "Over 50"
            case .itemsUnder50:
                return "Under 50"
            }
        }
        
    }
    
    @IBAction func addNewItem(_ sender: UIButton) {
        let newItem = itemStore.createItem()
        
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SectionType(rawValue: section)?.title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch SectionType(rawValue: section) {
        case .itemsUnder50:
            return itemStore.itemsUnder50.count
        case .itemsOver50:
            return itemStore.itemsOver50.count
        case .none:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        var item = Item()
        
        if indexPath.section == 0 {
            item = itemStore.itemsOver50[indexPath.row]
        } else {
            item = itemStore.itemsUnder50[indexPath.row]
        }
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
}
