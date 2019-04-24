//
//  WeatherServiceTestCase.swift
//  P9Tests
//
//  Created by macbook pro on 22/04/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

@testable import P9
import XCTest

class WeatherServiceTestCase: XCTestCase {
    
    let fakeResponseData = FakeResponseData()
    let expectation = XCTestExpectation(description: Constants.changeQueue)
    
    func testGetWheaterShouldPostFailedCallbackIfError() {

//        let weatherService = WheatherService(session: URLSessionFake(data: nil, response: nil, error: fakeResponseData.error), imageSession: nil)
        let weatherService = WheatherService(session: URLSessionFake(data: nil, response: nil, error: fakeResponseData.error), imageSession: URLSessionFake(data: nil, response: nil, error: nil))

        weatherService.getWeather { (success, weatherResult, iconURLs) in
            XCTAssertFalse(success)
            XCTAssertNil(weatherResult)
            XCTAssertNil(iconURLs)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherShouldPostFailedCalbackIfNoData() {
        //given
        let weatherService = WheatherService(session: URLSessionFake(data: nil, response: nil, error: nil), imageSession: URLSessionFake(data: nil, response: nil, error: nil))
        //when
        weatherService.getWeather { (success, weatherResult, iconURLs) in
            //then
            XCTAssertFalse(success)
            XCTAssertNil(weatherResult)
            XCTAssertNil(iconURLs)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherShouldPostFailedCalbackIfStatusCodeResponse500 () {
        //given
        let weatherService = WheatherService(session: URLSessionFake(data: fakeResponseData.correctDataWeather, response: fakeResponseData.responseNotOK, error: nil), imageSession: URLSessionFake(data: nil, response: nil, error: nil))
        //when
        weatherService.getWeather { (success, weatherResult, iconURLS) in
            XCTAssertTrue(success)
            XCTAssertNil(weatherResult)
            XCTAssertNil(iconURLS)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherShouldPostFailedCalbackIfStatusCodeResponse400 () {
        //given
        let weatherService = WheatherService(session: URLSessionFake(data: fakeResponseData.correctDataWeather, response: fakeResponseData.responseNotOK2, error: nil), imageSession: URLSessionFake(data: nil, response: nil, error: nil))
        //when
        weatherService.getWeather { (success, weatherResult, iconURLS) in
            XCTAssertFalse(success)
            XCTAssertNil(weatherResult)
            XCTAssertNil(iconURLS)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherShouldPostFailedCallbackIfIncorrectData() {
        //given
        let weatherService = WheatherService(session: URLSessionFake(data: fakeResponseData.incorrectData, response: fakeResponseData.responseOK, error: nil), imageSession: URLSessionFake(data: nil, response: nil, error: nil))
        //when
        weatherService.getWeather { (success, weatherResult, iconURLs) in
            XCTAssertFalse(success)
            XCTAssertNil(weatherResult)
            XCTAssertNil(iconURLs)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherShouldPostFailedCallbackIfResponseIsNotHHTPURLResponse() {
        
        let weatherService = WheatherService(session: URLSessionFake(data: fakeResponseData.correctDataWeather, response: fakeResponseData.responseNotTypeHTTPURLResponse, error: nil), imageSession: URLSessionFake(data: nil, response: nil, error: nil))
        weatherService.getWeather { (success, weatherResult, iconsURLs) in
            XCTAssertTrue(success)
            XCTAssertNil(weatherResult)
            XCTAssertNil(iconsURLs)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherShouldPostFailedCallbackIfNotContainWeatherLeft() {
        let weatherService = WheatherService(session: URLSessionFake(data: fakeResponseData.weatherDataWithoutLeftWeather, response: fakeResponseData.responseOK, error: nil), imageSession: URLSessionFake(data: nil, response: nil, error: nil))
        weatherService.getWeather { (success, weatherResult, urlsIcons) in
            XCTAssertTrue(success)
            XCTAssertNotNil(weatherResult)
            XCTAssertNil(urlsIcons)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherShouldPostFailedCallbackIfNotContainWeatherRight() {
        let weatherService = WheatherService(session: URLSessionFake(data: fakeResponseData.weatherDataWithoutRightWeather, response: fakeResponseData.responseOK, error: nil), imageSession: URLSessionFake(data: nil, response: nil, error: nil))
        weatherService.getWeather { (success, weatherResult, iconsUrls) in
            XCTAssertTrue(success)
            XCTAssertNotNil(weatherResult)
            XCTAssertNil(iconsUrls)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherWithDataIconLeftImcomplete() {
        
        let weatherService = WheatherService(session: URLSessionFake(data: fakeResponseData.weatherDataWithoutLeftIcon, response: fakeResponseData.responseOK, error: nil), imageSession: URLSessionFake(data: nil, response: nil, error: nil))
        
        weatherService.getWeather { (success, weatherResult, iconURLs) in
            XCTAssertTrue(success)
            XCTAssertNotNil(weatherResult)
            XCTAssertNil(iconURLs)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherWithDataIconRightIncomplete() {
        
        let weatherService = WheatherService(session: URLSessionFake(data: fakeResponseData.weatherDataWithoutRightIcon, response: fakeResponseData.responseOK, error: nil), imageSession: URLSessionFake(data: nil, response: nil, error: nil))
        
        weatherService.getWeather { (success, weatherAPIResult, iconURLs) in
            XCTAssertTrue(success)
            XCTAssertNotNil(weatherAPIResult)
            XCTAssertNil(iconURLs)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        
        let weatherService = WheatherService(session: URLSessionFake(data: fakeResponseData.correctDataWeather, response: fakeResponseData.responseOK, error: nil), imageSession: URLSessionFake(data: nil, response: nil, error: nil))
        
        let predictedCoordFirst = Coord(lon: 2.35, lat: 48.86)
        let predictedSysFirst = Sys(type: 1, id: 6540, message: 0.0072, country: "FR", sunrise: 1555908409, sunset: 1555959069)
        let predictedWeatherFirst = Weather(id: 800, main: "Clear", description: "ciel dégagé", icon: "01d")
        let predictedMainFirst = Main(temp: 25.0, pressure: 1001, humidity: 33, tempMin: 24.10, tempMax: 26.30)
        let predictedCloudsFirst = Clouds(all: 0)
        let predictedWindFirst = Wind(speed: 5.1, deg: 70)
        let predictedNameFirst = "Paris"
        
        let predictedCoordSecond = Coord(lon: -74.01, lat: 40.71)
        let predictedSysSecond = Sys(type: 1, id: 4610, message: 0.0098, country: "US", sunrise: 1555927622, sunset: 1555976505)
        let predictedWeatherSecond = Weather(id: 501, main: "Rain", description: "pluie modérée", icon: "10d")
        let predictedMainSecond = Main(temp: 20.90, pressure: 1017, humidity: 63, tempMin: 18.15, tempMax: 21.48)
        let predictedCloudsSecond = Clouds(all: 90)
        let predictedWindSecond = Wind(speed: 1.5, deg: nil)
        let predictedNameSecond = "New York"
        
        let predictedListFirst = List(coord: predictedCoordFirst, sys: predictedSysFirst, weather: [predictedWeatherFirst], main: predictedMainFirst, visibility: 10000, wind: predictedWindFirst, clouds: predictedCloudsFirst, dt: 1555955112, id: 6455259, name: predictedNameFirst)
        
        let predictedListSecond = List(coord: predictedCoordSecond, sys: predictedSysSecond, weather: [predictedWeatherSecond], main: predictedMainSecond, visibility: 16093, wind: predictedWindSecond, clouds: predictedCloudsSecond, dt: 1555955112, id: 5128581, name: predictedNameSecond)
        
        let predictedWheatherAPIResult = WeatherAPIResult(cnt: 2, list: [predictedListFirst, predictedListSecond])
        
        weatherService.getWeather { (success, weatherResult, urlIcons) in
            
            XCTAssertTrue(success)
            
            XCTAssertNotNil(weatherResult)
            XCTAssertNotNil(urlIcons)
            XCTAssert(urlIcons!.count == 2)
            XCTAssert(weatherResult!.cnt == predictedWheatherAPIResult.cnt)
            
            XCTAssert(weatherResult!.list?.first?.name == predictedNameFirst)
            XCTAssert(weatherResult!.list?.first?.weather?.first?.icon == predictedWeatherFirst.icon)
            XCTAssert(weatherResult!.list?.first?.main?.temp == predictedMainFirst.temp)
            XCTAssert(weatherResult!.list?.first?.weather?.first?.description == predictedWeatherFirst.description)
            XCTAssert(weatherResult!.list?.first?.main?.humidity == predictedMainFirst.humidity)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetIconShouldPostSuccessCallbackIfCorrectImageDataAndResponseOK() {
        
        let weatherService = WheatherService(session: URLSessionFake(data: nil, response: nil, error: nil), imageSession: URLSessionFake(data: fakeResponseData.image, response: fakeResponseData.responseOK, error: nil))
        let imageData = "image".data(using: .utf8)
        
        weatherService.getIcon(from: URL(string: "www.urlTest.com")!) { (iconData) in
            XCTAssertNotNil(iconData)
            XCTAssert(iconData == imageData)
            print(imageData == iconData)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetIconShouldPostFailedCallbackIfError() {
        
        let weatherService = WheatherService(session: URLSessionFake(data: nil, response: nil, error: nil), imageSession: URLSessionFake(data: nil, response: nil, error: fakeResponseData.error))
        
        weatherService.getIcon(from: URL(string: "www.urlTest.com")!) { (iconData) in
            XCTAssertNil(iconData)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetIconShouldPostFailedCallbackIfIncorrectData() {
        
        let weatherService = WheatherService(session: URLSessionFake(data: nil, response: nil, error: nil), imageSession: URLSessionFake(data: fakeResponseData.incorrectData, response: nil, error: fakeResponseData.error))
        
        weatherService.getIcon(from: URL(string: "www.urlTest.com")!) { (iconData) in
            XCTAssertNil(iconData)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetIconShouldPostFailedCallbackIfResponseNotOK() {
        
        let weatherService = WheatherService(session: URLSessionFake(data: nil, response: nil, error: nil), imageSession: URLSessionFake(data: fakeResponseData.correctDataWeather, response: fakeResponseData.responseNotOK, error: nil))
    
        weatherService.getIcon(from: URL(string: "www.urlTest.com")!) { (iconData) in
            XCTAssertNil(iconData)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
