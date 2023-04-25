//
//  CardView.swift
//  Animations
//
//  Created by Raul Banut on 02.12.2022.
//

import SwiftUI

struct CardView: View {
    var food: Food
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(food.title)
                    .font(.title2)
                    .bold()
                
                Text(food.description)
                    .font(.body)
                    .minimumScaleFactor(0.9)
                    .lineLimit(3)
                
                Text(food.price)
                    .bold()
            }
            Spacer(minLength: 10)
            
            Image(food.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
