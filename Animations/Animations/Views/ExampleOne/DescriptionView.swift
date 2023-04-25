//
//  DescriptionView.swift
//  Animations
//
//  Created by Raul Banut on 17.11.2022.
//

import SwiftUI

struct DescriptionView: View {
    let title: String
    let caption: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .bold()
                .foregroundColor(color)
            
            Text(caption)
                .font(.caption)
                .foregroundColor(color)
        }
    }
}

#if DEBUG
struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(title: "Hello", caption: "Here is me", color: .black)
    }
}
#endif
