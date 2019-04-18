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
    
    private init() {}
    
    private let _url = "https://api.openweathermap.org/data/2.5/group?"
    private let _appid = "appid=\(APIKey.shared.apiKeyWeather)"
    private let _lang = "&lang=fr"
    private let _units = "&units=metric"
    private let _city_id = "&id=6455259,5128581"
    private var task: URLSessionDataTask?
    
    
    func getWeather(callback: @escaping (Bool, WeatherAPIResult?, [URL?]) -> Void) {
        
        let parameters = _appid + _lang + _units + _city_id
        
        guard let urlComplete: URL = URL(string: _url + parameters) else { print("url no ok"); callback(false, nil, [nil]); return }
        
        let session = URLSession(configuration: .default)
        let request = URLRequest(url: urlComplete)

        task?.cancel()
        task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil else { callback(false, nil, [nil]); return }
                
                guard let json = try? JSONDecoder().decode(WeatherAPIResult.self, from: data) else { callback(false, nil, [nil]); return }
                
                guard let firstIconLeft = json.list?[0].weather?.first else { callback(true,json,[nil]); return }
                guard let firstIconRight = json.list?[1].weather?.first else { return }
                guard let iconCodeLeft = firstIconLeft.icon else { callback(true, json, [nil]); return }
                guard let iconCodeRight = firstIconRight.icon else { callback(true, json, [nil]); return }
                
                let iconURLLeft = URL(string: "http://openweathermap.org/img/w/\(iconCodeLeft).png")
                let iconURLRight = URL(string: "http://openweathermap.org/img/w/\(iconCodeRight).png")
                
                callback(true, json, [iconURLLeft,iconURLRight])
            }
        }
        task?.resume()
    }
    
    func getIcon(from url: URL, callback: @escaping (UIImage?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse else { callback(nil); return }
                guard response.statusCode == 200 else { callback(nil); return }
                guard let data = data, error == nil else { callback(nil); return }
                guard let icon = UIImage(data: data) else { callback(nil); return }
                callback(icon)
            }
            
        } .resume()
    }
}
