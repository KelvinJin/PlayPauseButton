//
//  PlayPauseButton.swift
//  PlayPauseButton
//
//  Created by Jin Wang on 2/09/2014.
//  Copyright (c) 2014 UThoft. All rights reserved.
//

//import CoreGraphics
import QuartzCore
import UIKit

class PlayPauseButton : UIButton {
    
    var top: CAShapeLayer! = CAShapeLayer()
    var bottom: CAShapeLayer! = CAShapeLayer()
    var left: CAShapeLayer! = CAShapeLayer()
    
    let topStrokeStart: CGFloat = 0.00
    let topStrokeEnd: CGFloat = 0.212

    let topStrokeStartToValue: CGFloat = 0.7
    let topStrokeEndToValue: CGFloat = 1.0
    
    let bottomStrokeStart: CGFloat = 0.00
    let bottomStrokeEnd: CGFloat = 0.085

    let bottomStrokeStartToValue: CGFloat = 0.30
    let bottomStrokeEndToValue: CGFloat = 0.96
    
    var duration = 0.7
    
    var lineWidth: CGFloat = 4 {
        didSet {
            for layer in [ self.top, self.left, self.bottom ] {
                layer.lineWidth = lineWidth
            }
            self.setNeedsDisplay()
        }
    }
    var miterLimit: CGFloat = 4 {
        didSet {
            for layer in [ self.top, self.left, self.bottom ] {
                layer.miterLimit = miterLimit
            }
            self.setNeedsDisplay()
        }
    }
    var fillColor: CGColor? {
        didSet {
            self.bottom.fillColor = fillColor
            self.setNeedsDisplay()
        }
    }
    
    var strokeColor: CGColor = UIColor.whiteColor().CGColor {
        didSet {
            for layer in [ self.top, self.left, self.bottom ] {
                layer.strokeColor = strokeColor
            }
            self.setNeedsDisplay()
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.left.path      = leftPath(frame)
        self.top.path       = topPath(frame)
        self.bottom.path    = bottomPath(frame)
        
        for layer in [ self.bottom, self.left, self.top ] {
            layer.fillColor = fillColor
            layer.strokeColor = strokeColor
            layer.lineWidth = lineWidth
            layer.miterLimit = miterLimit
            layer.lineCap = kCALineCapRound
            layer.masksToBounds = true
            layer.anchorPoint = CGPointMake(0, 0)
            
            let strokingPath = CGPathCreateCopyByStrokingPath(layer.path, nil, 4, kCGLineCapRound, kCGLineJoinRound, 4)
            
            layer.bounds = CGPathGetPathBoundingBox(strokingPath)
            
            layer.actions = [
                "strokeStart": NSNull(),
                "strokeEnd": NSNull(),
                "transform": NSNull()
            ]
            
            self.layer.addSublayer(layer)
        }
        
        self.top.position = CGPointMake(self.bounds.midX - self.top.bounds.size.width / 2,
                                        self.bounds.midY - self.top.bounds.size.height / 2)
        self.top.strokeStart = topStrokeStart
        self.top.strokeEnd = topStrokeEnd
        
        self.left.position = self.top.position
        self.left.strokeStart = 0.0
        self.left.strokeEnd = 1.0
        
        self.bottom.position = CGPointMake(self.bounds.midX - self.bottom.bounds.size.width / 2,
                                           self.bounds.midY - self.bottom.bounds.size.height / 2)
        self.bottom.strokeStart = bottomStrokeStart
        self.bottom.strokeEnd = bottomStrokeEnd
        
    }
    
    func leftPath(frame: CGRect) -> CGPathRef {
        var path = UIBezierPath()
        path.moveToPoint(CGPointMake(frame.minX + 0.36553 * frame.width, frame.minY + 0.22612 * frame.height))
        path.addLineToPoint(CGPointMake(frame.minX + 0.36553 * frame.width, frame.minY + 0.77388 * frame.height))
        
        return path.CGPath
    }
    
    func topPath(frame: CGRect) -> CGPathRef {
        var thePath = UIBezierPath()
        thePath.moveToPoint(CGPointMake(frame.minX + 0.63447 * frame.width, frame.minY + 0.50000 * frame.height))
        thePath.addLineToPoint(CGPointMake(frame.minX + 0.36553 * frame.width, frame.minY + 0.22612 * frame.height))
        thePath.addLineToPoint(CGPointMake(frame.minX + 0.36553 * frame.width, frame.minY + 0.77388 * frame.height))
        thePath.addLineToPoint(CGPointMake(frame.minX + 0.63447 * frame.width, frame.minY + 0.77388 * frame.height))
        thePath.addLineToPoint(CGPointMake(frame.minX + 0.63447 * frame.width, frame.minY + 0.22612 * frame.height))
        
        return thePath.CGPath
    }
    
    func bottomPath(frame: CGRect) -> CGPathRef {
        let myPath = UIBezierPath()
        
        myPath.moveToPoint(CGPointMake(frame.minX + 0.36553 * frame.width, frame.minY + 0.77388 * frame.height))
        myPath.addLineToPoint(CGPointMake(frame.minX + 0.79584 * frame.width, frame.minY + 0.33567 * frame.height))
        myPath.addCurveToPoint(CGPointMake(frame.minX + 0.82273 * frame.width, frame.minY + 0.25351 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.79584 * frame.width, frame.minY + 0.33567 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.82273 * frame.width, frame.minY + 0.29459 * frame.height))
        myPath.addCurveToPoint(CGPointMake(frame.minX + 0.76895 * frame.width, frame.minY + 0.14396 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.82273 * frame.width, frame.minY + 0.21243 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.79937 * frame.width, frame.minY + 0.17494 * frame.height))
        myPath.addCurveToPoint(CGPointMake(frame.minX + 0.63447 * frame.width, frame.minY + 0.05494 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.72860 * frame.width, frame.minY + 0.10287 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.63447 * frame.width, frame.minY + 0.05494 * frame.height))
        
        myPath.addCurveToPoint(CGPointMake(frame.minX + 0.60931 * frame.width, frame.minY + 0.04784 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.62812 * frame.width, frame.minY + 0.05286 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.61874 * frame.width, frame.minY + 0.05019 * frame.height))
        myPath.addCurveToPoint(CGPointMake(frame.minX + 0.58750 * frame.width, frame.minY + 0.04296 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.60207 * frame.width, frame.minY + 0.04603 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.59480 * frame.width, frame.minY + 0.04440 * frame.height))
        
        // The following curve will be duplicated at last
        myPath.addCurveToPoint(CGPointMake(frame.minX + 0.17671 * frame.width, frame.minY + 0.17077 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.44336 * frame.width, frame.minY + 0.01448 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.28835 * frame.width, frame.minY + 0.05708 * frame.height))
        myPath.addCurveToPoint(CGPointMake(frame.minX + 0.17671 * frame.width, frame.minY + 0.82923 * frame.height), controlPoint1: CGPointMake(frame.minX + -0.00184 * frame.width, frame.minY + 0.35260 * frame.height), controlPoint2: CGPointMake(frame.minX + -0.00184 * frame.width, frame.minY + 0.64740 * frame.height))
        myPath.addCurveToPoint(CGPointMake(frame.minX + 0.82329 * frame.width, frame.minY + 0.82923 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.35526 * frame.width, frame.minY + 1.01105 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.64474 * frame.width, frame.minY + 1.01105 * frame.height))
        myPath.addCurveToPoint(CGPointMake(frame.minX + 0.82329 * frame.width, frame.minY + 0.17077 * frame.height), controlPoint1: CGPointMake(frame.minX + 1.00184 * frame.width, frame.minY + 0.64740 * frame.height), controlPoint2: CGPointMake(frame.minX + 1.00184 * frame.width, frame.minY + 0.35260 * frame.height))
        myPath.addCurveToPoint(CGPointMake(frame.minX + 0.63742 * frame.width, frame.minY + 0.05583 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.76941 * frame.width, frame.minY + 0.11590 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.70542 * frame.width, frame.minY + 0.07758 * frame.height))
        // Duplication here
        myPath.addCurveToPoint(CGPointMake(frame.minX + 0.17671 * frame.width, frame.minY + 0.17077 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.44336 * frame.width, frame.minY + 0.01448 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.28835 * frame.width, frame.minY + 0.05708 * frame.height))
        
        return myPath.CGPath
    }


    var showsMenu: Bool = false {
        didSet {
            var strokeStart = CABasicAnimation(keyPath: "strokeStart")
            var strokeEnd = CABasicAnimation(keyPath: "strokeEnd")


            if self.showsMenu {
                strokeStart.toValue = bottomStrokeStartToValue
                strokeStart.duration = duration
                strokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.38, 0.14, 0.35, 2)
                
                strokeEnd.toValue = bottomStrokeEndToValue
                strokeEnd.duration = duration * 1.1
                strokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.38, 0.14, 0, 1.26)
            } else {
                strokeStart.toValue = bottomStrokeStart
                strokeStart.duration = duration
                strokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.34, -0.43, 0.48, -0.4)
//                strokeStart.beginTime = CACurrentMediaTime() + 0.1
//                strokeStart.fillMode = kCAFillModeBackwards
                
                strokeEnd.toValue = bottomStrokeEnd
                strokeEnd.duration = duration * 1.1
                strokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.13, -0.47, 0.79, 1.0)

            }

            self.bottom.ocb_applyAnimation(strokeStart)
            self.bottom.ocb_applyAnimation(strokeEnd)

            if self.showsMenu {
                strokeStart.toValue = topStrokeStartToValue
                strokeStart.duration = duration
                strokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.8, -0.3, 0.65, 1.0)
                
                strokeEnd.toValue = topStrokeEndToValue
                strokeEnd.duration = duration * 1.1
                strokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.6, -0.44, 0.13, 0.97)
            } else {
                strokeStart.toValue = topStrokeStart
                strokeStart.duration = duration
                strokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.6, 0, 0.13, 0.97)
//                strokeStart.beginTime = CACurrentMediaTime() + 0.1
//                strokeStart.fillMode = kCAFillModeBackwards
                
                strokeEnd.toValue = topStrokeEnd
                strokeEnd.duration = duration * 1.1
                strokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.8, -0.3, 0.65, 1.52)
            }

            self.top.ocb_applyAnimation(strokeStart)
            self.top.ocb_applyAnimation(strokeEnd)

        }
    }
}

extension CALayer {
    func ocb_applyAnimation(animation: CABasicAnimation) {
        let copy = animation.copy() as CABasicAnimation
        
        if copy.fromValue == nil {
            copy.fromValue = self.presentationLayer().valueForKeyPath(copy.keyPath)
        }
        copy.removedOnCompletion = false;
        copy.fillMode = kCAFillModeForwards;
        // The animation object is already copied in the following method. So probably we don't need copy here.
        self.addAnimation(copy, forKey: copy.keyPath)
        
//        self.setValue(copy.toValue, forKeyPath:copy.keyPath)
    }
}