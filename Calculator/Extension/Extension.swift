//
//  Extension.swift
//  Calculator
//
//  Created by Mac on 19.11.2023.
//

import SwiftUI

extension Color {
    static let darkgrayCalc = Color("darkgrayCalc")
    static let lightgrayCalc = Color("lightgrayCalc")
    static let orangeCalc = Color("orangeCalc")
}

extension Buttons {
    func ButtonToOperation() -> Operation {
        switch self {
        case .plus:
            return .addition
        case .minus:
            return .substraction
        case .multiply:
            return .multiplication
        case .devide:
            return .devision
        default:
            return .none
        }
    }
}
