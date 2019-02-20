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
    
    let currencyDestination = 0.0
    
    func convert(money: Double) -> Double {
        let result = money * currencyDestination
        return result
    }
}
