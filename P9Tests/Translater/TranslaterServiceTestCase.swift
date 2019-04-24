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
        //given
        let translaterService = TranslaterService(session: URLSessionFake(data: nil, response: nil, error: nil))
        //when
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
        //given
        let translaterService = TranslaterService(session: URLSessionFake(data: fakeResponseData.correctDataTranslation, response: fakeResponseData.responseNotOK, error: nil))
        //when
        translaterService.getTranslation { (success, translation) in
            //then
            XCTAssertTrue(success)
            XCTAssertNil(translation)
            XCTAssertNil(translation?.translatedText?.last)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostFailedCalbackIfStatusCodeResponse400 () {
        //given
        let translaterService = TranslaterService(session: URLSessionFake(data: fakeResponseData.correctDataTranslation, response: fakeResponseData.responseNotOK2, error: nil))
        //when
        translaterService.getTranslation { (success, translation) in
            //then
            XCTAssertFalse(success)
            XCTAssertNil(translation)
            XCTAssertNil(translation?.translatedText?.last)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostFailedCalbackIfIncorrectData() {
        //given
        let translaterService = TranslaterService(session: URLSessionFake(data: fakeResponseData.incorrectData, response: fakeResponseData.responseOK, error: nil))
        //when
        translaterService.getTranslation { (success, translation) in
            //then
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
        //given
        let translaterService = TranslaterService(session: URLSessionFake(data: fakeResponseData.correctDataTranslation, response: fakeResponseData.responseOK, error: nil))
        
        let predictedTranslation = Translation(translatedText: "hello")
        //when
        translaterService.getTranslation { (success, translation) in
            //then
            XCTAssertTrue(success)
            XCTAssertNotNil(translation)
            XCTAssert(translation!.translatedText == predictedTranslation.translatedText)
            
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func testPlacementOfAnApostropheEncodedInHTML_ChecksThatTheApostropheHasBeenDecoded() {

        let translaterService = TranslaterService(session: URLSessionFake(data: nil, response: nil, error: nil))
        let textWithoutApostrophe = translaterService.replaceCharactersOfTranslatedText(translatedText: "Text without apostrophe")
        XCTAssert(textWithoutApostrophe == "Text without apostrophe")

        let apostropheDecoded = translaterService.replaceCharactersOfTranslatedText(translatedText: Constants.apostropheCode)

        XCTAssert(apostropheDecoded == Constants.apostrophe)
    }
}
