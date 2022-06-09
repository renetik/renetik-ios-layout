//
// Created by Rene Dohan on 2/14/20.
//

import UIKit

public extension UIView {

    func position(left: CGFloat, top: CGFloat) -> Self {
        self.left = left
        self.top = top
        return self
    }

    var position: CGPoint {
        get { frame.origin }
        set {
            var frame = frame
            frame.origin = newValue
            self.frame = frame
        }
    }

    func position(_ point: CGPoint) -> Self { position = point; return self }

    var x: CGFloat { position.x }
    var y: CGFloat { position.y }
    var left: CGFloat {
        get { position.left }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    var top: CGFloat {
        get { position.top }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    var right: CGFloat {
        get { left + width }
        set { left = newValue - width }
    }
    var bottom: CGFloat {
        get { top + height }
        set { top = newValue - self.height }
    }
    var fromRight: CGFloat {
        get { superview.notNil ? superview!.width - (left + width) : 0 }
        set(value) {
            assert(superview.notNil, "Needs to have superview")
            left = superview!.width - (value + width)
        }
    }
    var fromBottom: CGFloat {
        get { superview.notNil ? superview!.height - (top + height) : 0 }
        set(value) {
            assert(superview.notNil, "Needs to have superview")
            top = superview!.height - (value + height)
        }
    }
    var leftFromRight: CGFloat { superview.notNil ? superview!.width - left : width }
    var topFromBottom: CGFloat { superview.notNil ? superview!.height - top : height }
    var screenTop: CGFloat {
        get { convert(CGPoint(x: 0, y: top), to: nil).y }
        set(value) { top = convert(CGPoint(x: 0, y: value), from: nil).y }
    }
    var screenBottom: CGFloat {
        get { convert(CGPoint(x: 0, y: bottom), to: nil).y }
        set(value) { bottom = convert(CGPoint(x: 0, y: value), from: nil).y }
    }

    func center(_ point: CGPoint) -> Self { center = point; return self }

    func center(_ x: CGFloat, _ y: CGFloat) -> Self { center(CGPoint(x: x, y: y)) }

    var centerTop: CGFloat {
        get { center.y }
        set(value) { center = CGPoint(x: center.x, y: value) }
    }

    var centerLeft: CGFloat {
        get { center.x }
        set(value) { center = CGPoint(x: value, y: center.y) }
    }

    @discardableResult
    func center(y: CGFloat) -> Self { invoke { centerTop = y } }

    @discardableResult
    func center(x: CGFloat) -> Self { invoke { centerLeft = x } }

    @discardableResult
    func center(top y: CGFloat) -> Self { invoke { centerTop = y } }

    @discardableResult
    func center(left x: CGFloat) -> Self { invoke { centerLeft = x } }

    @discardableResult
    func centerTop(as view: UIView) -> Self { center(top: view.centerTop) }

    @discardableResult
    func centerLeft(as view: UIView) -> Self { center(left: view.center.left) }

    @discardableResult
    func centerVertical(as view: UIView) -> Self { centerTop(as: view) }

    @discardableResult
    func centerHorizontal(as view: UIView) -> Self { centerLeft(as: view) }

    @discardableResult
    func centerVerticalAsPrevious() -> Self {
        assert(superview.notNil, "Needs to have superview")
        let previous = superview!.findPrevious(of: self)
        assert(previous.notNil, "Needs to have previous")
        return centerVertical(as: previous!)
    }

    @discardableResult
    func centered() -> Self {
        assert(superview.notNil, "Needs to have superview")
        center = CGPoint(x: superview!.width / 2, y: superview!.height / 2)
        return self
    }

    @discardableResult
    func centeredVertical() -> Self {
        assert(superview.notNil, "Needs to have superview")
        center = CGPoint(x: center.x, y: superview!.height / 2)
        return self
    }

    @discardableResult
    func centeredHorizontal() -> Self {
        assert(superview.notNil, "Needs to have superview")
        center = CGPoint(x: superview!.width / 2, y: center.y)
        return self
    }


}
