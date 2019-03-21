//
//  TranlateViewController.swift
//  P9
//
//  Created by Mac Book Pro on 23/01/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

class TranlateViewController: UIViewController {

    @IBOutlet weak var languageDestinationLabel: CustomLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initialization of the gesture 
        view.addGestureToHideKeyboard()
        // we fill the array with the different cases of enumeration
        Data.shared.enumCaseToArrayOrDictionnary(enumeration: .Languages)
    }
}
