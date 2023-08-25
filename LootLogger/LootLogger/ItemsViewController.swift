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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        let newItem = itemStore.createItem()
        
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            tableView.insertRows(at: [indexPath], with: .fade)
            //            navigationController?.navigationBar.backItem?.title = ""
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemStore.allItems[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "itemIdentifier", for: indexPath) as? ItemTableViewCell {
            cell.backgroundColor = .white
            
            cell.nameLabel.text = item.isFavorite ? "\(item.name) ⭐️" : item.name
            cell.priceLabel.text = "$\(item.valueInDollars)"
            cell.serialNumberLabel.text = item.serialNumber
            
            cell.priceLabel.textColor = item.valueInDollars >= 50 ? .systemGreen : .systemRed
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
}

extension ItemsViewController {
    //MARK: Actions and functions for Swipe Action
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let actionFavorite = UIContextualAction(style: .normal, title: "Favorite") { [weak self] (_, _, completionHandler) in
            self?.toggleFavorite(for: indexPath)
            
            completionHandler(true)
        }
        actionFavorite.backgroundColor = .systemYellow
        
        let actionDelete = UIContextualAction(style: .normal, title: "Delete") { [weak self] (_, _, completionHandler) in
            self?.deleteItem(for: indexPath)
            
            completionHandler(true)
        }
        actionDelete.backgroundColor = .systemRed
        
        
        return UISwipeActionsConfiguration(actions: [actionDelete, actionFavorite])
    }
    
    private func toggleFavorite(for indexPath: IndexPath) {
        let item = itemStore.allItems[indexPath.row]
        item.isFavorite.toggle()
        
        if let cell = tableView.cellForRow(at: indexPath) as? ItemTableViewCell {
            cell.nameLabel.text = item.isFavorite ? "\(item.name) ⭐️" : item.name
        }
    }
    
    private func deleteItem(for indexPath: IndexPath) {
        let item = itemStore.allItems[indexPath.row]
        
        itemStore.removeItem(item)
        
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

extension ItemsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            
        case "showItem":
            if let row = tableView.indexPathForSelectedRow?.row {
                
                // Get the item associated with this row and pass it along
                let item = itemStore.allItems[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.item = item
                
                self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                                        style: .plain,
                                                                        target: nil,
                                                                        action: nil)
                
                self.navigationItem.backBarButtonItem?.tintColor = .black
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
}
