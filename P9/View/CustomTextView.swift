//
//  CustomTextView.swift
//  P9
//
//  Created by Mac Book Pro on 07/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

class CustomTextView: UITextView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // setting up of the textView
    func setup() {
        layer.backgroundColor = UIColor.clear.cgColor
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = frame.height / 2
        layer.shadowRadius = 2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: -2, height: 2)
        layer.shadowOpacity = 1
        clipsToBounds = true
    }
}
