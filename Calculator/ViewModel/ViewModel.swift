//
//  ViewModel.swift
//  Calculator
//
//  Created by Mac on 19.11.2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    // MARK: property
    @Published var value = "0"
    @Published private var number: Double = 0.0
    @Published private var currentOperation: Operation = .none
    
    let buttonsArray: [[Buttons]] = [
        [.clear, .negative, .percent, .devide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    // MARK: Tap button method
    
    func didTap(item: Buttons) {
        switch item {
        case .plus, .minus, .devide, .multiply:
            currentOperation = item.ButtonToOperation()
            number = Double(value) ?? 0
            value = "0"
        case .decimal:
            if !value.contains("."){
                value += "."
            }
        case .percent:
            if let currentValue = Double(value){
                value = formatResult(result: currentValue / 100)
            }
        case .negative:
            if let currentValue = Double(value){
                value = formatResult(result: -currentValue)
            }
        case .clear:
            value = "0"
        case .equal:
            if let currentValue = Double(value) {
                value = formatResult(result: performOperation(currentValue: currentValue))
        }
        default:
            if value == "0" {
                value = item.rawValue
            } else {
                value += item.rawValue
            }
        }
    }
    
    // MARK: Helper Calculate Method
    
    func performOperation(currentValue: Double) -> Double {
        switch currentOperation {
        case .addition:
            return number + currentValue
        case .substraction:
            return number - currentValue
        case .multiplication:
            return number * currentValue
        case .devision:
            return number / currentValue
        default:
            return currentValue
        }
    }
    
    // MARK: Remove last zero Method
    func formatResult(result: Double) -> String {
        return String(format: "%g", result)
    }
    
    // MARK: size buttons methods
    func buttonWidth(item: Buttons) -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 5 * spacing
        let zeroTotalSpacing: CGFloat = 4 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        if item == .zero {
            return (screenWidth - zeroTotalSpacing) / totalColumns * 2
        }
        
        return (screenWidth - totalSpacing) / totalColumns
    }
    
    func buttonHeight() -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 5 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        return (screenWidth - totalSpacing) / totalColumns
    }
}
