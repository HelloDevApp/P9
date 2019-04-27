//
//  Converter.swift
//  P9
//
//  Created by Mac Book Pro on 14/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

class Converter {
    
    // ccontains the full name and rate of the destination currency
    private var _rateValueDestination = 0.0
    
    var rateValueDestination: Double {
        return _rateValueDestination
    }
    
    // allows you to change the values of the tuple rateValueDestination .name and .rates
    func changeValueOfRateDestination(rate: Double) {
        _rateValueDestination = rate
    }
    
    // is used to calculate and return the result
    private func _convert(moneyToConvert: Double) -> Double {
        // contains the rate of the destination currency
        let rateValueDestination = _rateValueDestination
        // contains the result of the operation
        let result = moneyToConvert * rateValueDestination
        return result
    }
    
    // simply returns the private method convert()
    func convert(moneyToConvert: Double) -> Double {
        return _convert(moneyToConvert: moneyToConvert)
    }
}
