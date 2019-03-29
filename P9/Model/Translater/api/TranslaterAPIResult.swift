//
//  TranslaterAPIResult.swift
//  P9
//
//  Created by Mac Book Pro on 22/03/2019.
//  Copyright © 2019 dylan. All rights reserved.
//


// the structure that will receive the JSON values received by the API
struct TranslaterAPIResult: Decodable {
    let data: DataClass?
}

// the structure that will contain all translations
struct DataClass: Decodable {
    let translations: [Translation]?
}

// the structure that will contain the current translation
struct Translation: Decodable {
    let translatedText: String?
}
