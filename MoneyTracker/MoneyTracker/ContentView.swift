//
//  ContentView.swift
//  MoneyTracker
//
//  Created by Banut Raul on 23.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            
            TabBarWrapper()
//                .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
