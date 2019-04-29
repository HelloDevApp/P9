//
//  ConverterServiceTestCase.swift
//  P9Tests
//
//  Created by macbook pro on 21/04/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

@testable import P9

import XCTest

class ConverterServiceTestCase: XCTestCase {
    
    let fakeResponseData = FakeResponseData()
    let expectation = XCTestExpectation(description: "wait, for queue change.")
    
    func testGetRatesShouldPostFailedCallbackIfError() {
        
        let converterService = ConverterService(session: URLSessionFake(data: nil, response: nil, error: fakeResponseData.error))
        
        converterService.getRates { (success, rates, datesRates)  in
            
            XCTAssertFalse(success)
            XCTAssertNil(rates)
            XCTAssertNil(datesRates)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRatesShouldPostFailedCallbackIfNoData() {
        
        let converterService = ConverterService(session: URLSessionFake(data: nil, response: nil, error: nil))
        
        converterService.getRates { (success, rates, datesRates) in
            
            XCTAssertFalse(success)
            XCTAssertNil(rates)
            XCTAssertNil(datesRates)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRatesShouldPostFailedCallbackIfResponseIsNotHTTPURLResponse() {
        let converterService = ConverterService(session: URLSessionFake(data: fakeResponseData.correctDataConversion, response: fakeResponseData.responseNotTypeHTTPURLResponse, error: nil))
        converterService.getRates { (success, rates, datesRates) in
            XCTAssertTrue(success)
            XCTAssertNil(rates)
            XCTAssertNil(datesRates)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRatesShouldPostFailedCallbackIfStatusCodeResponse500() {
        
        let converterService = ConverterService(session: URLSessionFake(data: fakeResponseData.correctDataConversion, response: fakeResponseData.responseNotOK, error: nil))
        
        converterService.getRates { (success, rates, datesRates) in
            
            XCTAssertTrue(success)
            XCTAssertNil(rates)
            XCTAssertNil(datesRates)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRatesShouldPostFailedCallbackIfStatusCode400() {
        
        let converterService = ConverterService(session: URLSessionFake(data: fakeResponseData.correctDataConversion, response: fakeResponseData.responseNotOK2, error: nil))
        
        converterService.getRates { (success, rates, datesRates) in
            XCTAssertFalse(success)
            XCTAssertNil(rates)
            XCTAssertNil(datesRates)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRatesShouldPostFailedCallbackIfDataIncorrect() {
        
        let converterService = ConverterService(session: URLSessionFake(data: fakeResponseData.incorrectData, response: fakeResponseData.responseOK, error: nil))
        
        converterService.getRates { (success, rates, datesRates) in
            
            XCTAssertFalse(success)
            XCTAssertNil(rates)
            XCTAssertNil(datesRates)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRatesShouldPostFailedCallbackIfDataNotContainRates() {
        let converterService = ConverterService(session: URLSessionFake(data: fakeResponseData.dataConversionWithoutRates, response: fakeResponseData.responseOK, error: nil))
        converterService.getRates { (success, rates, datesRates) in
            XCTAssertFalse(success)
            XCTAssertNil(rates)
            XCTAssertNil(datesRates)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRatesShouldPostFailedCallbackIfDataNotContainTimestamp() {
        let converterService = ConverterService(session: URLSessionFake(data: fakeResponseData.dataConversionWithoutTimestamp, response: fakeResponseData.responseOK, error: nil))
        converterService.getRates { (success, rates, datesRates) in
            XCTAssertTrue(success)
            XCTAssertNotNil(rates)
            XCTAssertNil(datesRates)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRatesShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
    
        let converterService = ConverterService(session: URLSessionFake(data: fakeResponseData.correctDataConversion, response: fakeResponseData.responseOK, error: nil))
        
        let predictedRates = Rates(AUD: 1.571367, CAD: 1.507089, CHF: 1.141015, COP: 3540.962588, GBP: 0.865385, HKD: 8.822266, ILS: 4.042899, USD: 1.124651)
        
        converterService.getRates { (success, rates, datesRates) in
            
            XCTAssertTrue(success)
            XCTAssertNotNil(rates)
            XCTAssertNotNil(datesRates)
            XCTAssert(rates?.AUD == predictedRates.AUD)
            XCTAssert(rates?.CAD == predictedRates.CAD)
            XCTAssert(rates?.CHF == predictedRates.CHF)
            XCTAssert(rates?.COP == predictedRates.COP)
            XCTAssert(rates?.GBP == predictedRates.GBP)
            XCTAssert(rates?.HKD == predictedRates.HKD)
            XCTAssert(rates?.ILS == predictedRates.ILS)
            XCTAssert(rates?.USD == predictedRates.USD)
            
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
