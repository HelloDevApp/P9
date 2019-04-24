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
    let nameTest = "test"
    let rateTest = 2.0
    let moneyToConvertTest = 10.0

    func test_ChangeValueOfRateValueDestination_CheckIfNewValueIsCorrect() {
        
        changeValueOfRateValueDestination(name: nameTest, rate: rateTest)
        
        XCTAssert(converter.rateValueDestination.name == nameTest)
        XCTAssert(converter.rateValueDestination.rate == rateTest)
    }
    
    func test_ChangeValueOfRateValueDestination_StartOfTheConversion_CheckIfResultIsCorrect() {
        
        changeValueOfRateValueDestination(name: nameTest, rate: rateTest)
        
        let result = converter.convert(moneyToConvert: moneyToConvertTest)
        
        XCTAssert(result == moneyToConvertTest * 2.0)
    }
    
    func changeValueOfRateValueDestination(name: String, rate: Double) {
        converter.changeValueOfRateDestination(name: name, rate: rate)
    }
    
    func testGivenInitDictEmpty_WhenConvertEnumCaseToDictionnary_ThenNumberOfElementsIsDifferentOfZero() {
        
        Converter.shared.dictOfCurrenciesNamesShortAndFull = [String:String]()
        
        CurrenciesNames.convertEnumCaseToDictionnary()
        
        XCTAssert(Converter.shared.dictOfCurrenciesNamesShortAndFull.count > 0)
    }
}


