//
//  Currencies.swift
//  P9
//
//  Created by Mac Book Pro on 29/03/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

//=====================================================
//MARK:-----------------Converter----------------------
//=====================================================
enum Currencies: String, CaseIterable {
    
    // Cannadian Dollars
    case cad
    // United State Dollars
    case usd
    // Bitcoins
    case btc
    // Australian Dollars
    case aud
    // British Pound Sterling
    case gbp
    // Israeli New Sheqel
    case ils
    // Swiss Franc
    case chf
    // Colombian Peso
    case cop
    // Hong Kong Dollars
    case hkd
}

extension Currencies {
    // allows you to fill in a array containing all the cases of the enumeration
    static func convertToArray() {
        //
        for value in Currencies.allCases {
            // for currencies, we use the uppercased() method to have all the text in capitals.
            Converter.shared.arrayCurrencies.append(value.rawValue.uppercased())
        }
    }
}
