//
//  CurrencyViewController.swift
//  P9
//
//  Created by Mac Book Pro on 05/01/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // initialization of the gesture
        view.addGestureToHideKeyboard()
        // we fill the array with the different cases of enumeration
        Data.shared.enumCaseToArray(enumeration: .Currency)
    }
}
