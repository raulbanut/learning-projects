//
//  GreetingsView.swift
//  MoneyTracker
//
//  Created by Banut Raul on 26.05.2023.
//

import SwiftUI

struct GreetingsView: View {
    let userName = "Johnny"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(configureGreetingMessage())")
                .background(.red)
            
            Text("\(userName)")
                .background(.yellow)
        }
    }
    
    func configureGreetingMessage() -> String {
        let hour = Calendar.current.component(.hour, from: .now)
        
        if (hour >= 1 && hour < 12) {
            return "Good morning,"
        } else if (hour >= 12 && hour < 17) {
            return "Good afternoon,"
        } else {
            return "Good evening,"
        }
    }
}

struct GreetingsView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingsView()
    }
}
