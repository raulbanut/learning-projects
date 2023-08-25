//
//  ItemStore.swift
//  LootLogger
//
//  Created by Banut Raul on 18.07.2023.
//

import Foundation
import UIKit

class ItemStore {
    
    var allItems = [Item]()
    let itemArchiveURL: URL = {
        let documentsDirectories =
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.plist")
    }()
    
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedItems = allItems[fromIndex]
        
        allItems.remove(at: fromIndex)
        
        allItems.insert(movedItems, at: toIndex)
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    func updateItemStatusFavoriteVariable(at index: Int, with isFavoriteNewStatus: Bool) {
        allItems[index].isFavorite = isFavoriteNewStatus
    }
    
    func saveChanges() -> Bool {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(allItems)
        } catch let encodingError {
            print("Error encoding allItems: \(encodingError)")
        }

        return false
    }
}
