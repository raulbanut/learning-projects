//
//  CalculatorButtonType.swift
//  CloneCalculator
//
//  Created by Banut Raul on 21.06.2023.
//

import Foundation
import SwiftUI

enum CalculatorButtonType: String {
    case zero = "0"
    case decimal = ","
    case equal = "="
    
    case one = "1"
    case two = "2"
    case three = "3"
    case add = "+"
    
    case four = "4"
    case five = "5"
    case six = "6"
    case substract = "-"
    
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case multiply = "x"
    
    case delete  = "AC"
    case negative = "-/+"
    case percentage = "%"
    case divide = "/"
    
    var buttonColor: Color {
        switch self {
        case .multiply, .divide, .add, .substract, .equal:
            return Color.orange
        case .delete, .negative, .percentage:
            return Color.gray.opacity(1)
        default:
            return Color.gray.opacity(0.5)
        }
    }
    
    var textColor: Color {
        switch self {
        case .delete, .negative, .percentage:
            return Color.black
        default:
            return Color.white
        }
    }
}
