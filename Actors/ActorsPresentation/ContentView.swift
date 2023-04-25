//
//  ContentView.swift
//  ActorsPresentation
//
//  Created by Raul Banut on 20.09.2022.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Game using Actors")
            
            Text("\(viewModel.points) $")
                .onReceive(viewModel.timer) { _ in
                    viewModel.getMoney()
                }
            
            Button {
                viewModel.addMoneyButton()
            } label: {
                Text("Get money")
                    .font(.system(size: 18, weight: .bold))
            }
            .foregroundColor(.black)
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.red.opacity(0.5))
            )
            
            Button {
                viewModel.addMoneyGenerator()
            } label: {
                Text("Add money generator")
                    .font(.system(size: 18, weight: .bold))
            }
            .foregroundColor(.black)
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.red.opacity(0.5))
            )
            
//            Button {
//                viewModel.toggleMoneyGenerators()
//            } label: {
//                Text(viewModel.moneyGeneratorsEnabled ? "Pause money generators" : "Start money generators")
//                    .font(.system(size: 18, weight: .bold))
//            }
//            .foregroundColor(.black)
//            .padding(16)
//            .background(
//                RoundedRectangle(cornerRadius: 16)
//                    .foregroundColor(.red.opacity(0.5))
//            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
