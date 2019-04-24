//
//  ExtensionUIViewController.swift
//  P9
//
//  Created by Mac Book Pro on 08/04/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alert(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: Constants.ok, style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
