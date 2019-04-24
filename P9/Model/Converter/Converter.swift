//
//  Converter.swift
//  P9
//
//  Created by Mac Book Pro on 14/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

class Converter {
    
    static let shared = Converter()
    
    // the dictionary which will contain the abbreviated names and full names of each currency
    var dictOfCurrenciesNamesShortAndFull = [String:String]()
    
    // ccontains the full name and rate of the destination currency
    private var _rateValueDestination = (name: Constants.stringEmpty, rate: 0.0)
    
    var rateValueDestination: (name: String, rate: Double) {
        return _rateValueDestination
    }
    
    // allows you to change the values of the tuple rateValueDestination .name and .rates
    func changeValueOfRateDestination(name: String, rate: Double) {
        _rateValueDestination.name = name
        _rateValueDestination.rate = rate
    }
    
    // is used to calculate and return the result
    private func _convert(moneyToConvert: Double) -> Double {
        // contains the rate of the destination currency
        let rateValueDestination = _rateValueDestination.rate
        // contains the result of the operation
        let result = moneyToConvert * rateValueDestination
        Console.shared.printDescriptionResultConversion(moneyToConvert: moneyToConvert, result: result, nameCurrencyDestination: _rateValueDestination.name)
        return result
    }
    
    // simply returns the private method convert()
    func convert(moneyToConvert: Double) -> Double {
        return _convert(moneyToConvert: moneyToConvert)
    }
}
