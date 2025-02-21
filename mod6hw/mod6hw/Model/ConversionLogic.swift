//
//  ConversionLogic.swift
//  mod6hw
//
//  Created by user272531 on 2/19/25.
//

import Foundation

struct ConversionLogic {
    static let currencyNames = ["Brazilian Reais", "Russian Rubles", "Indian Rupees", "Chinese Yuan"]
    static let conversionRates: [Double] = [5.67, 89.63, 86.88, 7.28] // Reais, Rubles, Rupees, Yuan

    static func convert(amount: Int, forCurrencyIndex index: Int) -> Double {
        return Double(amount) * conversionRates[index]
    }
    static func getCurrencyName(for index: Int) -> String {
        return currencyNames[index]
    }
}
