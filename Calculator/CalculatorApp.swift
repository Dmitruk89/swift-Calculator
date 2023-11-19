//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Mac on 18.11.2023.
//

import SwiftUI

@main
struct CalculatorApp: App {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
