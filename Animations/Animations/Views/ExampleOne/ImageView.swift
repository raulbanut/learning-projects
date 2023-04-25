//
//  ImageView.swift
//  Animations
//
//  Created by Raul Banut on 17.11.2022.
//

import SwiftUI

struct ImageView: View {
    let name: String
    
    var body: some View {
        Image(name)
            .resizable()
            .edgesIgnoringSafeArea(.top)
            .frame(height: 450)
    }
}

#if DEBUG
struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(name: "landscape")
    }
}
#endif
