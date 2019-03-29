//
//  CurrenciesNames.swift
//  P9
//
//  Created by Mac Book Pro on 29/03/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

//=====================================================
//MARK:-----------------Converter----------------------
//=====================================================
enum CurrenciesNames: String, CaseIterable {
    // Cannadian Dollars
    case cad = "Dollars Canadien"
    // United State Dollars
    case usd = "Dollars"
    // Bitcoins
    case btc = "Bitcoins"
    // Australian Dollars
    case aud = "Dollars Australien"
    // British Pound Sterling
    case gbp = "Livres Sterling"
    // Israeli New Sheqel
    case ils = "Sheckel"
    // Swiss Franc
    case chf = "Francs Suisse"
    // Colombian Peso
    case cop = "Pesos Colombien"
    // Hong Kong Dollars
    case hkd = "Dollars de Hong Kong"
}

extension CurrenciesNames {
    
    // allows you to fill in a array containing all the cases of the enumeration
    static func convertEnumCaseToDictionnary() {
        for currencyName in CurrenciesNames.allCases {
            Converter.shared.dictOfCurrenciesNamesShortAndFull["\(currencyName)".uppercased()] = currencyName.rawValue
        }
        print("\n", Converter.shared.dictOfCurrenciesNamesShortAndFull.sorted(by: <),"\n")
    }
}
