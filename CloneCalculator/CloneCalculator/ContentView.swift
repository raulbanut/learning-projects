//
//  ContentView.swift
//  CloneCalculator
//
//  Created by Banut Raul on 16.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    
    let buttons: [[CalculatorButtonType]] = [
        [.delete, .negative , .percentage, .divide],
        [.seven, .eight , .nine, .multiply],
        [.four, .five , .six, .substract],
        [.one, .two , .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text(value)
                    .bold()
                    .font(.system(size: 72))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity ,maxHeight: .infinity, alignment: .bottomTrailing)
                
                ForEach(buttons, id: \.self) { row in
                    HStack(alignment: .center, spacing: 5) {
                        ForEach(row, id: \.self) { item in
                            CalculatorButton(
                                value: $value,
                                runningNumber: $runningNumber,
                                currentOperation: $currentOperation,
                                button: item
                            )
                        }
                    }
                }
            }
            .padding()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
