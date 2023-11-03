//
//  ScalledImageView.swift
//  CoordinatorProject
//
//  Created by Banut Raul on 18.10.2023.
//

import SwiftUI

struct ScalledImageView: View {
    let name: String
    
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    ScalledImageView(name: "tara1")
}
