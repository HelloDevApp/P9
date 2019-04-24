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
    
    func testWhenGetTargetLangForSetup_ThenTargetLangEqualToMiddleArrayRowLanguages() {
        
        Translater.shared.getTargetLang(forSetup: true, row: nil)
        
        XCTAssert(Translater.shared.targetLang == "\(Languages.allCases[Languages.allCases.count/2])")
    }
    
    func testWhenGetTargetLang_ThenTargetLangEqualToChooseRow() {
        
        Translater.shared.getTargetLang(forSetup: false, row: 0)
        
        XCTAssert(Translater.shared.targetLang == "\(Languages.allCases[0])")
    }
}
