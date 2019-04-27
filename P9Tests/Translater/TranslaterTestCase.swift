//
//  TranslaterTestCase.swift
//  P9Tests
//
//  Created by macbook pro on 22/04/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

@testable import P9
import XCTest

class TranslaterTestCase: XCTestCase {
    
    let translater = Translater()
    
    func testWhenGetTargetLangForSetup_ThenTargetLangEqualToMiddleArrayRowLanguages() {
        
        translater.getTargetLang(forSetup: true, row: nil)
        
        XCTAssert(translater.targetLang == "\(Languages.allCases[Languages.allCases.count/2])")
    }
    
    func testWhenGetTargetLang_ThenTargetLangEqualToChooseRow() {
        
        translater.getTargetLang(forSetup: false, row: 0)
        
        XCTAssert(translater.targetLang == "\(Languages.allCases[0])")
    }
}
