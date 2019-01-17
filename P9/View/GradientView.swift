//
//  GradientView.swift
//  P9
//
//  Created by Mac Book Pro on 17/01/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

class GradientView: UIView {
    var gradientLayer: CAGradientLayer!
    
    var firstColor = UIColor(red: 80/255, green: 107/255, blue: 225/255, alpha: 1) {
        didSet {
            setNeedsLayout()
        }
    }
var secondColor = UIColor(red: 15/255, green: 33/255, blue: 75/255, alpha: 1) {
        didSet {
            setNeedsLayout()
        }
    }
    var startPointX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var startPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    var endPointX: CGFloat = 1 {
        didSet {
            setNeedsLayout()
        }
    }
    var endPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    var cornerRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutSubviews()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutSubviews()
    }
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer = layer as? CAGradientLayer
        gradientLayer.colors = [firstColor.cgColor,secondColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        gradientLayer.cornerRadius = cornerRadius
    }
    
}
