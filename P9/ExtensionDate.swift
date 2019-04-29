//
//  ExtensionDate.swift
//  P9
//
//  Created by macbook pro on 29/04/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation

extension Date {
    // returns a date in a custom format
    func returnDateFormat() -> String {
        let date = self
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormat // "dd/MM/yyyy HH:mm"
        let dateFormat = formatter.string(from: date)
        
        return dateFormat
    }
}
