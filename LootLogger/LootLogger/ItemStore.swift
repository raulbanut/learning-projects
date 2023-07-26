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
}
