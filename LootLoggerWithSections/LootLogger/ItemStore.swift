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
    
    var itemsOver50 = [Item]()
    var itemsUnder50 = [Item]()
        
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        if newItem.valueInDollars > 50 {
            itemsOver50.append(newItem)
        } else {
            itemsUnder50.append(newItem)
        }
        
        return newItem
    }
}
