//
//  GradientView.swift
//  P9
//
//  Created by Mac Book Pro on 17/01/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit
//@IBDesignable
class GradientView: UIView {
    
    var gradientLayer: CAGradientLayer?
    
    @IBInspectable var firstColor: UIColor = .white {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var secondColor: UIColor = .black {
        didSet {
            setNeedsLayout()
        }
    }
    
    // the horizontal point where the gradient begins
    var startPointX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    // the vertical point where the gradient begins
    var startPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    // the horizontal point where the gradient finish
    var endPointX: CGFloat = 1 {
        didSet {
            setNeedsLayout()
        }
    }
    
    // the vertical point where the gradient finish
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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutSubviews()
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    // method that assigns values to the gradient
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer = layer as? CAGradientLayer
        gradientLayer?.colors = [firstColor.cgColor,secondColor.cgColor]
        gradientLayer?.startPoint = CGPoint(x: startPointX, y: startPointY)
        gradientLayer?.endPoint = CGPoint(x: endPointX, y: endPointY)
        gradientLayer?.cornerRadius = cornerRadius
    }
    
}
