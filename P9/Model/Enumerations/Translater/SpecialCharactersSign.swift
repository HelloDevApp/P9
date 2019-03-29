//
//  SpecialCharactersSign.swift
//  P9
//
//  Created by Mac Book Pro on 29/03/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

//=====================================================
//MARK:----------------Translate-----------------------
//=====================================================
enum SpecialCharactersSign: String, CaseIterable {
    // '
    case apostrophe = "’"
    // ‘
    case apostrophe1 = "‘"
    // "
    case apostrophe2 = "\""
    // #
    case hashtag = "#"
    //
    case space = " "
    // Ç
    case cCedillaUppercase = "Ç"
    // ç
    case cCedilla = "ç"
}

//=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
//MARK:-+-+-+-+-+--+-+-+-Extensions-+-+-+-+-+--+-+-+-+-
//=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
extension SpecialCharactersSign {
    // allows you to fill in a dictionary with the names of the usual characters and the corresponding hexadecimal codes
    static func createDictionnaryOfSpecialCharactersSignAndCodes() {
        for character in SpecialCharactersSign.allCases {
            for characterCode in SpecialCharactersCodes.allCases {
                if "\(character)" == "\(characterCode)" {
                    Translater.shared.dictOfSpecialCharactersAndCodes[character.rawValue] = characterCode.value
                    break
                }
            }
        }
    }
}
