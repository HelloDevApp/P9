//
//  ConverterCurrency.swift
//  P9
//
//  Created by Mac Book Pro on 14/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

class ConverterCurrency {
    
    static let shared = ConverterCurrency()
    
    // contains the full name of the destination currency and also the value of the rate
    private var _rateValueDestination = (name: "", rates: 0.0)
    
    // allows you to change the values of the tuple rateValueDestination .name and .rates
    func changeValueOfRateValueDestination(name: String, rates: Double) {
        _rateValueDestination.name = name
        _rateValueDestination.rates = rates
    }
    
    // is used to calculate and return the result
    private func _convert(moneyToConvert: Double) -> Double {
        // contains the rate of the destination currency
        let destinationRateValue = _rateValueDestination.rates
        // contains the result of the operation
        let result = moneyToConvert * destinationRateValue
        Console.shared.printDescriptionResultConversion(moneyToConvert: moneyToConvert, result: result, nameCurrencyDestination: _rateValueDestination.name)
        return result
    }
    
    // simply returns the private method convert() 'included in the CurrencyController extension'
    func convert(moneyToConvert: Double) -> Double {
        return _convert(moneyToConvert: moneyToConvert)
    }
}
