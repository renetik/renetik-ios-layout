//
// Created by Rene on 2018-11-22.
// Copyright (c) 2018 Renetik Software. All rights reserved.
//

import UIKit
import Renetik

//import RenetikBlocksKit

//extension UIView {
//    @discardableResult
//    @objc override open func construct() -> Self { setAutoresizingDefaults() }
//}

public extension UIView {
    
//    override open func construct() -> Self {
//        super.construct().setAutoresizingDefaults()
//    }
    
    class func construct(owner: NSObject? = nil, xib: String) -> Self {
        let arrayOfXibObjects = Bundle.main.loadNibNamed(xib, owner: owner, options: nil)
        let instance = (arrayOfXibObjects?[0] as? Self)?.construct()
        return instance!
    }
    
    class func construct(width: CGFloat, height: CGFloat) -> Self {
        construct().width(width, height: height)
    }
    
    class func construct(left: CGFloat, top: CGFloat, width: CGFloat, height: CGFloat) -> Self {
        construct().position(left: left, top: top).width(width, height: height)
    }
    
    class func construct(width: CGFloat) -> Self {
        construct().width(width)
    }
    
    class func construct(height: CGFloat) -> Self {
        construct().height(height)
    }
    
    class func construct(color: UIColor) -> Self {
        construct().background(color)
    }
    
    class func construct(frame: CGRect) -> Self {
        construct().frame(frame)
    }
    
    @discardableResult
    @objc class func construct(defaultSize: Bool = false) -> Self {
        let _self: Self = Self()
        if defaultSize { _self.defaultSize() }
        _self.construct()
        return _self
    }
    
    @discardableResult
    func debugLayoutByRandomBorderColor() -> Self {
        border(color: .random)
        debugLayoutBySubviewsRandomBorderColor()
        return self
    }
    
    private func debugLayoutBySubviewsRandomBorderColor() {
        subviews.each {
            $0.border(color: .random)
            $0.debugLayoutBySubviewsRandomBorderColor()
        }
    }
    
    @discardableResult
    func debugLayoutByRandomBackgroundColor() -> Self {
        background(.random)
        debugLayoutBySubviewsRandomBackgroundColor()
        return self
    }
    
    private func debugLayoutBySubviewsRandomBackgroundColor() {
        subviews.each {
            $0.background(.random)
            $0.debugLayoutBySubviewsRandomBackgroundColor()
        }
    }
    
    func child(at condition: (UIView) -> Bool) -> UIView? { subviews.first(where: condition) }
}
