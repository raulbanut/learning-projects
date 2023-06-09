//
//  SplashScreen.swift
//  MoneyTracker
//
//  Created by Banut Raul on 31.05.2023.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color.puertoRico
                .ignoresSafeArea(.container, edges: .vertical)
            
            Text("money")
                .font(.Main.Bold.largeTitle)
                .foregroundColor(.white)    
        }
    }
}

class SplashViewController: UIHostingController<SplashScreen> {
    
    init(onFinishedInteraction: @escaping () -> Void) {
        super.init(rootView: SplashScreen())
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
