//
//  WeatherService.swift
//  P9
//
//  Created by Mac Book Pro on 29/03/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation
import UIKit

class WheatherService {
    
    static let shared = WheatherService()
    
    private let _url = "https://api.openweathermap.org/data/2.5/group?"
    private let _appid = "appid=\(APIKey.shared.apiKeyWeather)"
    private let _lang = "&lang=fr"
    private let _units = "&units=metric"
    private let _city_id = "&id=6455259,5128581"
    
    private var session: URLSession
    private var imageSession: URLSession
    
    private var task: URLSessionDataTask?
    
    init(session: URLSession = URLSession(configuration: .default), imageSession: URLSession = URLSession(configuration: .default)) {
        self.session = session
        self.imageSession = imageSession
    }
    
    func getWeather(callback: @escaping (Bool, WeatherAPIResult?, [URL?]?) -> Void) {
        
        let parameters = _appid + _lang + _units + _city_id
        
        guard let urlComplete: URL = URL(string: _url + parameters) else {
            print("url no ok")
            callback(false, nil, nil)
            return
        }

        let request = URLRequest(url: urlComplete)
        
        task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    print(ErrorMessages.errorDataNilOrError_Weather)
                    callback(false, nil, nil)
                    return
                }
                guard let response = response as? HTTPURLResponse else {
                    print(ErrorMessages.errorResponseIsNotHTTPURLResponse_Weather)
                    callback(true, nil, nil)
                    return
                }
                guard response.statusCode != 500 else {
                    print(ErrorMessages.errorStatusCode500_Weather)
                    callback(true, nil, nil)
                    return
                }
                guard response.statusCode == 200 else {
                    print(ErrorMessages.errorStatusCode400_Weather)
                    callback(false, nil, nil)
                    return
                }
                guard let json = try? JSONDecoder().decode(WeatherAPIResult.self, from: data) else {
                    print(ErrorMessages.errorJSONDecoder_Weather)
                    callback(false, nil, nil)
                    return
                }
                
                guard let firstIconCodeLeft = json.list?[0].weather?.first else {
                    print(ErrorMessages.errorIconsIsNil)
                    callback(true, json, nil)
                    return
                }
                
                guard let firstIconCodeRight = json.list?[1].weather?.first else {
                    print(ErrorMessages.errorIconsIsNil)
                    callback(true, json, nil)
                    return
                }
                
                guard let iconCodeLeft = firstIconCodeLeft.icon else {
                    print(ErrorMessages.errorIconCodeIsNil)
                    callback(true, json, nil)
                    return
                }
                guard let iconCodeRight = firstIconCodeRight.icon else {
                    print(ErrorMessages.errorIconCodeIsNil)
                    callback(true, json, nil)
                    return
                }
                
                let iconURLLeft = URL(string: "http://openweathermap.org/img/w/\(iconCodeLeft).png")
                let iconURLRight = URL(string: "http://openweathermap.org/img/w/\(iconCodeRight).png")
                
                callback(true, json, [iconURLLeft,iconURLRight])
            }
        }
        task?.resume()
    }
    
    func getIcon(from url: URL, callback: @escaping (Data?) -> Void) {
        
        task = imageSession.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    print(ErrorMessages.errorDataNilOrError_Weather)
                    callback(nil)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print(ErrorMessages.errorResponseIsNotHTTPURLResponse_Weather)
                    callback(nil)
                    return
                }
                callback(data)
            }
        }
        task?.resume()
    }
}
