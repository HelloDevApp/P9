//
//  ConverterService.swift
//  P9
//
//  Created by Mac Book Pro on 21/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//


import Foundation

class ConverterService {
    
    //URL base
    private let _url = URL(string: "http://data.fixer.io/api/")!
    
    //parameters request
    private let _parameters = "latest?access_key=\(APIKey.shared.apiKeyConverter)&symbols=CAD,EUR,USD,BTC,AUD,GBP,ILS,CHF,COP,HKD"
    
    // complete URL
    private var _urlComplete: URL {
        return URL(string: "\(_url)\(_parameters)")!
    }
    
    // the session
    private var session: URLSession
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    // allow create request
    func getRates(callback: @escaping (Bool, Rates?, String?) -> Void) {
        
        // the request
        var request = URLRequest(url: _urlComplete)
        request.httpMethod = Constants.getMethod
        
        // the task
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                
                guard let data = data, error == nil else {
                    print(ErrorMessages.errorDataNilOrError_Converter)
                    callback(false, nil, nil)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    print(ErrorMessages.errorResponseIsNotHTTPURLResponse_Converter)
                    callback(true, nil, nil)
                    return
                }
                
                guard response.statusCode != 500 else {
                    print(ErrorMessages.errorStatusCode500_Converter)
                    callback(true, nil, nil)
                    return
                }
                
                guard response.statusCode == 200 else {
                    print(ErrorMessages.errorStatusCode_Converter)
                    callback(false, nil, nil)
                    return
                }
                
                // we decode the JSON
                let dataJSON = try? JSONDecoder().decode(Result.self, from: data)
                
                // we check that the dataJSON is not nil
                guard let json = dataJSON else {
                    print(ErrorMessages.errorJSONDecoder_Converter)
                    callback(false, nil, nil)
                    return
                }
                
                // we check that the rates is not nil
                guard let rates = json.rates else {
                    print(ErrorMessages.errorJSONRatesIsNil_Converter)
                    callback(false, nil, nil)
                    return
                }
                
                let dateRates = self._getUpdateDateOfRates(responseJSON: json)
                
                callback(true, rates, dateRates)
                return
            }
        }
        task.resume()
    }
    
    // retrieve the date of the last update of the rates
    private func _getUpdateDateOfRates(responseJSON: Result) -> String? {
        
        guard let timestamp = responseJSON.timestamp else {
            print(ErrorMessages.noTimestamp)
            return nil
        }
        
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormat = date.returnDateFormat()
        let dateString = "le taux a été mis à jour le: \(dateFormat)"
        
        return dateString
    }
}
