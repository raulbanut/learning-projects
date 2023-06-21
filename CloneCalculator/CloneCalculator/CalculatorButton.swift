//
//  CalculatorButton.swift
//  CloneCalculator
//
//  Created by Banut Raul on 16.06.2023.
//

import SwiftUI

struct CalculatorButton: View {
    @Binding var value: String
    @Binding var runningNumber: Int
    @Binding var currentOperation: Operation
    
    var button: CalculatorButtonType = .add
    
    var body: some View {
        Button {
            didTap(button: button)
        } label: {
            Text(button.rawValue)
                .foregroundColor(button.textColor)
                .bold()
                .font(.system(size: 28))
                .frame(
                    width: button == .zero ? 180 : 90,
                    height: 90
                )
                .background(button.buttonColor)
                .foregroundColor(.white)
                .cornerRadius(45)
        }
    }
    
    func didTap(button: CalculatorButtonType) {
        switch button {
        case .add, .substract, .multiply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add
                self.runningNumber = Int(value) ?? 0
            } else if button == .substract {
                self.currentOperation = .substract
                self.runningNumber = Int(value) ?? 0
            }
            else if button == .substract {
                self.currentOperation = .substract
                self.runningNumber = Int(value) ?? 0
            }
            else if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber = Int(value) ?? 0
            }
            else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Int(value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation {
                case .add:
                    self.value = "\(runningValue + currentValue)"
                case .substract:
                    self.value = "\(runningValue - currentValue)"
                case .multiply:
                    self.value = "\(runningValue * currentValue)"
                case .divide:
                    self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            
            if button != .equal {
                self.value = "0"
            }
        case .delete:
            self.value = "0"
        case .decimal, .negative, .percentage:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                self.value = number
            } else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
}



struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CalculatorButton(
                value: .constant("0"),
                runningNumber: .constant(0),
                currentOperation: .constant(.none),
                button: .add)
            CalculatorButton(
                value: .constant("0"),
                runningNumber: .constant(0),
                currentOperation: .constant(.none),
                button: .nine)
            CalculatorButton(
                value: .constant("0"),
                runningNumber: .constant(0),
                currentOperation: .constant(.none),
                button: .percentage)
        }
        HStack {
            CalculatorButton(
                value: .constant("0"),
                runningNumber: .constant(0),
                currentOperation: .constant(.none),
                button: .add)
            CalculatorButton(
                value: .constant("0"),
                runningNumber: .constant(0),
                currentOperation: .constant(.none),
                button: .nine)
            CalculatorButton(
                value: .constant("0"),
                runningNumber: .constant(0),
                currentOperation: .constant(.none),
                button: .percentage)
        }.previewDevice("iPhone SE (3rd generation)")
    }
}
