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
    func printDescriptionResultConversion(moneyToConvert: Double, result: Double, nameCurrencyDestination: String) {
        print("\(moneyToConvert) euros est égal à: \(result) \(nameCurrencyDestination)")

    }
    
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
