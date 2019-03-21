//
//  ConverterAPIResult.swift
//  P9
//
//  Created by Mac Book Pro on 28/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation

// the structure that will receive the JSON values received by the API
struct Result: Decodable {
    var success: Bool?
    var timestamp: Int?
    var base: String?
    var date: String?
    var rates: Rates?
}

// the structure that will receive all the rate values
struct Rates: Decodable {
    var AUD: Double?
    var BTC: Double?
    var CAD: Double?
    var CHF: Double?
    var COP: Double?
    var EUR: Double?
    var GBP: Double?
    var HKD: Double?
    var ILS: Double?
    var USD: Double?
}
