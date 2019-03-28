//
//  Enums.swift
//  P9
//
//  Created by Mac Book Pro on 20/03/2019.
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

//=====================================================
//MARK:----------------Translate-----------------------
//=====================================================
enum Languages: String, CaseIterable {
    // 🇺🇸
    case english = "Anglais"
    // 🇪🇸
    case spanish = "Espagnol"
    // 🇻🇳
    case vietnam = "Vietnamien"
    // 🇩🇪
    case german = "Allemand"
    // 🇨🇳
    case chinese = "Chinois"
    // 🇮🇹
    case italian = "Italien"
}

//=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
//MARK:-+-+-+-+-+-Extensions Of Enumerations-+-+-+-+-+-
//=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
extension CurrenciesNames {
    
    // allows you to fill in a array containing all the cases of the enumeration
    static func convertEnumCaseToDictionnary() {
        for currencyName in CurrenciesNames.allCases {
            Data.shared.dictOfCurrenciesNamesShortAndFull["\(currencyName)".uppercased()] = currencyName.rawValue
        }
        print("\n",Data.shared.dictOfCurrenciesNamesShortAndFull.sorted(by: <),"\n")
    }
}


extension Currencies {
    // allows you to fill in a array containing all the cases of the enumeration
    static func convertToArray() {
        //
        for value in Currencies.allCases {
            // for currencies, we use the uppercased() method to have all the text in capitals.
            Data.shared.arrayCurrencies.append(value.rawValue.uppercased())
        }
    }
}

extension Languages {
    // allows you to fill in a array containing all the cases of the enumeration
    static func convertToArray() {
        for value in Languages.allCases {
            // for languages, we use the capitalized() method to have a capital letter in the first letter
            Data.shared.arrayLanguages.append(value.rawValue.capitalized)
        }
    }
}
