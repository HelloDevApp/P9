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
    private let _parameters = "latest?access_key=\(APIKey.shared.apiKeyConverter)&symbols=CAD,EUR,USD,BTC,AUD,GBP,ILS,CHF,COP,HKD"
    
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
            
            guard let data = data, error == nil else { callback(false, nil); return }
            // we decode the JSON
            let dataJSON = try? JSONDecoder().decode(Result.self, from: data)
            // we check that the dataJSON is not nil
            guard let json = dataJSON else { callback(false, nil); return }
            // we check that the rates is not nil
            guard let rates = json.rates else { callback(false, nil); return }
            // we get the time of update of the rates
            self.getUpdateDateOfRates(responseJSON: json)
            callback(true, rates)
            return
        }
        task.resume()
    }
    
    // retrieve the date of the last update of the rates
    private func getUpdateDateOfRates(responseJSON: Result) {
        
        guard let timestamp = responseJSON.timestamp else { return }
        Console.shared.printLastUpdateRate(timestamp: timestamp)
    }
}
