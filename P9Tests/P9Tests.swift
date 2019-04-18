//
//  P9Tests.swift
//  P9Tests
//
//  Created by Mac Book Pro on 05/01/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import XCTest
@testable import P9

class P9Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGivenUpdateRatesValues_ThenResultIsNotNil() {
        
    }
    
    func testGivenMoneyToTranslateEqualTen_WhenLaunchConvert_ThenWeCheckThatTheResultIsCorrect() {
        
        let moneyToConvert = 10.0
        Converter.shared.changeValueOfRateDestination(name: "moneyTest", rates: 2.0)
        
        let result = Converter.shared.convert(moneyToConvert: moneyToConvert)
        
        XCTAssert(result == 20.0)
    }
    
    func testWhenGetTargetLangForSetup_ThenTargetLangEqualToMiddleArrayRowLanguages() {
        
        Translater.shared.getTargetLang(forSetup: true, row: nil)
        
        XCTAssert(Translater.shared.targetLang == "\(Languages.allCases[Languages.allCases.count/2])")
    }
    
    func testWhenGetTargetLang_ThenTargetLangEqualToChooseRow() {
        
        Translater.shared.getTargetLang(forSetup: false, row: 0)
        
        XCTAssert(Translater.shared.targetLang == "\(Languages.allCases[0])")
    }
    
    func testGivenInitDictEmpty_WhenConvertEnumCaseToDictionnary_ThenNumberOfElementsIsDifferentOfZero() {
        
        Converter.shared.dictOfCurrenciesNamesShortAndFull = [String:String]()
        
        
        CurrenciesNames.convertEnumCaseToDictionnary()

        XCTAssert(Converter.shared.dictOfCurrenciesNamesShortAndFull.count > 0)
    }
    
    func testCountryWeather() {
        
        XCTAssert(Weather_.shared.country.count == 2)
    }
}
