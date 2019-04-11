//
//  Console.swift
//  P9
//
//  Created by Mac Book Pro on 15/03/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation

class Console {
    
    static var shared = Console()
    
    //=====================================================
    //MARK:------------------Convert-----------------------
    //=====================================================
    
    // allows you to display the result of the operation in the console
    func printDescriptionResultConversion(moneyToConvert: Double, result: Double, nameCurrencyDestination: String) {
        print("\(moneyToConvert) euros est égal à: \(result) \(nameCurrencyDestination)")

    }
    
    // allows you to display the last date of the rate update in the console
    func printLastUpdateRate(timestamp: Int) {
        print("le taux a été mis a jour le: \n"
            + "\(Date(timeIntervalSince1970: TimeInterval(timestamp)))")
    }
}

//=====================================================
//MARK:----------------Translate-----------------------
//=====================================================




//=====================================================
//MARK:----------------Weather-----------------------
//=====================================================
