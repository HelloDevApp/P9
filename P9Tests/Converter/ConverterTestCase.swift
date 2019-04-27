//
//  ConverterTestCase.swift
//  P9Tests
//
//  Created by macbook pro on 22/04/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

@testable import P9
import XCTest

class ConverterTestCase: XCTestCase {
    
    let converter = Converter()
    let rateTest = 2.0
    let moneyToConvertTest = 10.0

    func test_ChangeValueOfRateValueDestination_CheckIfNewValueIsCorrect() {
        
        converter.changeValueOfRateDestination(rate: rateTest)
        
        XCTAssert(converter.rateValueDestination == rateTest)
    }
    
    func test_ChangeValueOfRateValueDestination_StartOfTheConversion_CheckIfResultIsCorrect() {
        
        converter.changeValueOfRateDestination(rate: rateTest)
        XCTAssert(converter.rateValueDestination == rateTest)
        
        let result = converter.convert(moneyToConvert: moneyToConvertTest)
        
        XCTAssert(result == moneyToConvertTest * rateTest)
    }
}


