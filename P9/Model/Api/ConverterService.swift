//
//  ConverterService.swift
//  P9
//
//  Created by Mac Book Pro on 21/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//


import Foundation

class ConverterService {
    
    static let shared = ConverterService()
    
    //URL base
    private let _url = URL(string: "http://data.fixer.io/api/")!
    
    //parameters request
    private let _parameters = "latest?access_key=\(APIKey.shared.apiKey)&symbols=CAD,EUR,USD,BTC,AUD,GBP,ILS,CHF,COP,HKD"
    
    // complete URL
    private var _urlComplete: URL {
        return URL(string: "\(_url)\(_parameters)")!
    }
    // the session
    let session = URLSession(configuration: .default)
    
    // allow send request
    func getRates(callback: @escaping (Bool, Rates?) -> Void) {
        
        // the request
        var request = URLRequest(url: _urlComplete)
        request.httpMethod = "GET"
        
        // the task
        let task = session.dataTask(with: request) { (data, response, error) in
            
                if let data = data, error == nil {
                    // we decode the JSON
                    let dataJSON = try? JSONDecoder().decode(Result.self, from: data)
                    // we check that the dataJSON is not nil
                    guard let responseJSON = dataJSON else { return }
                    // we check that the rates is not nil
                    guard responseJSON.rates != nil else { return }
                    // we get the time of update of the rates
                    self.getUpdateDateOfRates(responseJSON: responseJSON)
                    // we call the method that will create the structure with the received values 
                    if let ratesStruct = self.createStructWithValuesOfResponseJson(responseJSON: responseJSON) {
                        callback(true, ratesStruct)
                    }
                callback(false, nil)
            }
        }
        task.resume()
    }
    
    // retrieve the date of the last update of the rates
    private func getUpdateDateOfRates(responseJSON: Result) {
        
        guard let timestamp = responseJSON.timestamp else { return }
        Console.shared.printLastUpdateRate(timestamp: timestamp)
    }
    
    // allows to create a structure with all the values received by the JSON
    private func createStructWithValuesOfResponseJson(responseJSON: Result) -> Rates? {
        
        guard let rates = responseJSON.rates else { return nil }
        // we initialize a structure with the values received by 'api'
        let ratesStruct = Rates(AUD: rates.AUD, BTC: rates.BTC, CAD: rates.CAD, CHF: rates.CHF, COP: rates.COP, EUR: rates.EUR, GBP: rates.GBP, HKD: rates.HKD, ILS: rates.ILS, USD: rates.USD)
        return ratesStruct
    }
}
