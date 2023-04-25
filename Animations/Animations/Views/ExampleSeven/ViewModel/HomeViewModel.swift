//
//  HomeViewModel.swift
//  Animations
//
//  Created by Raul Banut on 03.12.2022.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var offset: CGFloat = 0
    
    @Published var selectedTab = tabsItems.first!.tab
}
