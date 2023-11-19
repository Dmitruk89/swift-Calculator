//
//  Model.swift
//  Calculator
//
//  Created by Mac on 18.11.2023.
//

import SwiftUI

enum Operation {
    case addition, substraction, multiplication, devision, none
}

enum Buttons: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case plus = "+"
    case minus = "-"
    case multiply = "x"
    case devide = "/"
    case equal = "="
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    case clear = "AC"
    
    var buttonColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return Color.lightgrayCalc
        case .devide, .multiply, .minus, .plus, .equal:
            return Color.orangeCalc
        default:
            return Color.darkgrayCalc
        }
        
    }
    
    var buttonFontColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return Color.black
        default:
            return Color.white
        }
        
    }
}
