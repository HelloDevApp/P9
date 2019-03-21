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
    print("\(moneyToConvert) euros font \(result) \(nameCurrencyDestination)")
    }
    
    func printInfosNameCaseCurrencies(i: Int, nameCaseCurrencies: String) {
        print("Le nom de la devises à trouvé coresspond à:\n")
        print("     Nom du cas: \(nameCaseCurrencies)")
        print("     Enum:  \(ListofEnumeration.Currencies)")
        print("     index:   \(i)")
        print("\n°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°\n\n")
    }
    
    func printInfoNameCaseCurrenciesNames(i2: Int, nameCaseCurrenciesNames: String) {
        print("Comparaison avec le nom du cas :\n")
        print("     Nom du cas: \(nameCaseCurrenciesNames)")
        print("     Enum:  \(ListofEnumeration.CurrenciesNames)")
        print("     index:   \(i2)")
    }
    
    func printInfoValue(nameCaseCurrencies: String, nameCurrencyOfCurrenciesNames: String, index: Int, index2: Int) {
        print("\n\nUne correspondance a été trouvée:\n")
        print("nameCaseCurrencies: \(nameCaseCurrencies), nameCaseCurrenciesNames: \(nameCurrencyOfCurrenciesNames)")
        print("nom du cas n° \(index) de l'enumeration Currencies: \(nameCaseCurrencies)\nnom de la devises qui correspond: \(nameCurrencyOfCurrenciesNames)")
        print("emplacement: cas n°\(index2) de l'enumeration: \(ListofEnumeration.CurrenciesNames)")
        print("°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°\n\n\n\n\n\n\n")
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
