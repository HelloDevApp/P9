//
//  ExtensionUIView.swift
//  P9
//
//  Created by Mac Book Pro on 14/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    // allows you to add a gesture associated with closing the keyboard
    public func addGestureToHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
    
    // allows you to hide the keyboard
    @objc func hideKeyboard() {
        self.endEditing(true)
    }
}
