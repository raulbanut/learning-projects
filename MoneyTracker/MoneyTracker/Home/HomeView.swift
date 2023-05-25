//
//  HomeView.swift
//  MoneyTracker
//
//  Created by Banut Raul on 25.05.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            GreetingsView()
            
            Text("Home")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.yellow)
        }
    }
}

class HomeViewController: UIHostingController<HomeView> {
    init() {
        super.init(rootView: HomeView())
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
