import UIKit
extension UIView {

    @discardableResult
    @objc class func construct() -> Self {
        let _self: Self = Self()
        _self.construct()
        return _self
    }

    @discardableResult
    @objc public class func construct(defaultSize: Bool = false) -> Self {
        let _self: Self = Self()
        if defaultSize { _self.defaultSize() }
        _self.construct()
        return _self
    }

    public class func construct(owner: NSObject? = nil, xib: String) -> Self {
        let arrayOfXibObjects = Bundle.main.loadNibNamed(xib, owner: owner, options: nil)
        let instance = (arrayOfXibObjects?[0] as? Self)?.construct()
        return instance!
    }

    public class func construct(width: CGFloat, height: CGFloat) -> Self {
        construct().width(width, height: height)
    }

    public class func construct(left: CGFloat, top: CGFloat, width: CGFloat, height: CGFloat) -> Self {
        construct().position(left: left, top: top).width(width, height: height)
    }

    public class func construct(width: CGFloat) -> Self {
        construct().width(width)
    }

    public class func construct(height: CGFloat) -> Self {
        construct().height(height)
    }

    public class func construct(color: UIColor) -> Self {
        construct().background(color)
    }

    public class func construct(frame: CGRect) -> Self {
        construct().frame(frame)
    }

    @discardableResult
    @objc open func construct() -> Self { setAutoresizingDefaults() }

    @discardableResult
    public func debugLayoutByRandomBorderColor() -> Self {
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
    public func debugLayoutByRandomBackgroundColor() -> Self {
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

    public func child(at condition: (UIView) -> Bool) -> UIView? { subviews.first(where: condition) }

    public var parent: UIView { superview! }
}
