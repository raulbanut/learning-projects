//
//  TabModel.swift
//  Animations
//
//  Created by Raul Banut on 03.12.2022.
//

import Foundation
import SwiftUI


/// Tab Model with Tab Items
///

struct Tab: Identifiable {
    var id = UUID().uuidString
    var tab: String
    var foods: [Food]
}

var tabsItems = [
    Tab(tab: "Order Again", foods: foods.shuffled()),
    Tab(tab: "Picked For You", foods: foods.shuffled()),
    Tab(tab: "Starters", foods: foods.shuffled()),
    Tab(tab: "Deserts", foods: foods.shuffled())
]
