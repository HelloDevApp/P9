//
//  TranslaterServiceTestCase.swift
//  P9Tests
//
//  Created by macbook pro on 22/04/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

@testable import P9
import XCTest

class TranslaterServiceTestCase: XCTestCase {
    
    let fakeResponseData = FakeResponseData()
    let expectation = XCTestExpectation(description: "Wait, for queue change")
    
    func testGetTranslationShouldPostFailedCallbackIfError() {

        let translaterService = TranslaterService(session: URLSessionFake(data: nil, response: nil, error: fakeResponseData.error))

        translaterService.getTranslation { (success, translation) in
            XCTAssertFalse(success)
            XCTAssertNil(translation)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostFailedCalbackIfNoData() {
        
        let translaterService = TranslaterService(session: URLSessionFake(data: nil, response: nil, error: nil))
        
        translaterService.getTranslation { (success, translation) in
            XCTAssertFalse(success)
            XCTAssertNil(translation)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostFailedCalbackIfResponseIsNotHTTPURLResponse() {
        let translaterService = TranslaterService(session: URLSessionFake(data: fakeResponseData.correctDataTranslation, response: fakeResponseData.responseNotTypeHTTPURLResponse, error: nil))
        translaterService.getTranslation { (success, translation) in
            XCTAssertFalse(success)
            XCTAssertNil(translation)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    func testGetTranslationShouldPostFailedCalbackIfStatusCodeResponse500 () {
        
        let translaterService = TranslaterService(session: URLSessionFake(data: fakeResponseData.correctDataTranslation, response: fakeResponseData.responseNotOK, error: nil))
        
        translaterService.getTranslation { (success, translation) in
            
            XCTAssertTrue(success)
            XCTAssertNil(translation)
            XCTAssertNil(translation?.translatedText?.last)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostFailedCalbackIfStatusCodeResponse400 () {
        
        let translaterService = TranslaterService(session: URLSessionFake(data: fakeResponseData.correctDataTranslation, response: fakeResponseData.responseNotOK2, error: nil))
        
        translaterService.getTranslation { (success, translation) in
            
            XCTAssertFalse(success)
            XCTAssertNil(translation)
            XCTAssertNil(translation?.translatedText?.last)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostFailedCalbackIfIncorrectData() {
        
        let translaterService = TranslaterService(session: URLSessionFake(data: fakeResponseData.incorrectData, response: fakeResponseData.responseOK, error: nil))
        
        translaterService.getTranslation { (success, translation) in
            
            XCTAssertFalse(success)
            XCTAssertNil(translation)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostFailedCallbackIfDataNotContainTranslations() {
        let translaterService = TranslaterService(session: URLSessionFake(data: fakeResponseData.incompleteDataTranslation, response: fakeResponseData.responseOK, error: nil))
        translaterService.getTranslation { (success, translation) in
            XCTAssertFalse(success)
            XCTAssertNil(translation)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        
        let translaterService = TranslaterService(session: URLSessionFake(data: fakeResponseData.correctDataTranslation, response: fakeResponseData.responseOK, error: nil))
        
        let predictedTranslation = Translation(translatedText: "hello")
        
        translaterService.getTranslation { (success, translation) in
            
            XCTAssertTrue(success)
            XCTAssertNotNil(translation)
            XCTAssert(translation!.translatedText == predictedTranslation.translatedText)
            
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func testPlacementOfAnApostropheEncodedInHTML_ChecksThatTheApostropheHasBeenDecoded() {
        
        let translateViewController = TranlateViewController()
        
        let textWithoutApostrophe = translateViewController.replaceCharactersOfTranslatedText(translatedText: "Text without apostrophe")
        XCTAssert(textWithoutApostrophe == "Text without apostrophe")

        let apostropheDecoded = translateViewController.replaceCharactersOfTranslatedText(translatedText: Constants.apostropheCode)

        XCTAssert(apostropheDecoded == Constants.apostrophe)
    }
    
    func testWhenGetTargetLangForSetup_ThenTargetLangEqualToMiddleArrayRowLanguages() {
        
        let translaterService = TranslaterService(session: URLSessionFake(data: nil, response: nil, error: nil))
        
        translaterService.getTargetLang(forSetup: true, row: nil)
        
        XCTAssert(translaterService.targetLang == "\(Languages.allCases[Languages.allCases.count/2])")
    }
    
    func testWhenGetTargetLang_ThenTargetLangEqualToChooseRow() {
        
        let translaterService = TranslaterService(session: URLSessionFake(data: nil, response: nil, error: nil))
        
        translaterService.getTargetLang(forSetup: false, row: 0)
        
        XCTAssert(translaterService.targetLang == "\(Languages.allCases[0])")
    }
}
