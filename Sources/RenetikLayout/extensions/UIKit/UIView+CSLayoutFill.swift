//
// Created by Rene Dohan on 12/23/19.
//

import UIKit
import Renetik

public extension UIView {

    @discardableResult
    func fill(horizontal margin: (left: CGFloat, right: CGFloat)) -> Self {
        from(left: margin.left).fill(right: margin.right)
    }

    @discardableResult
    func fill(horizontal margin: CGFloat) -> Self {
        from(left: margin).fill(right: margin)
    }

    func fill(vertical margin: (top: CGFloat, bottom: CGFloat)) -> Self {
        from(top: margin.top).fill(bottom: margin.bottom)
    }

    func fill(vertical margin: CGFloat) -> Self {
        from(top: margin).fill(bottom: margin)
    }

    @discardableResult
    func fill(left margin: CGFloat, flexible: Bool = false) -> Self {
        width = (right - margin).asUnsigned
        if flexible { fixedRight().flexibleWidth() }
        from(left: margin)
        return self
    }

    @discardableResult
    func fill(from: UIView, left: CGFloat, flexible: Bool = false) -> Self {
        self.fill(left: from.right + left, flexible: flexible)
    }

    @discardableResult
    func fill(top margin: CGFloat, flexible: Bool = false) -> Self {
        assert(superview.notNil, "Needs to have superview")
        let bottomCorrected = bottom - margin > 0 ? bottom : superview!.height
        height = (bottomCorrected - margin).asUnsigned
        from(top: margin)
        if flexible { fixedBottom().flexibleHeight() }
        return self
    }

    @discardableResult
    func fill(bottom: CGFloat, flexible: Bool = false) -> Self {
        assert(superview.notNil, "Needs to have superview")
        let bottom = superview!.height - bottom
        heightBy(bottom: bottom.asUnsigned)
        if flexible { fixedTop().flexibleHeight() }
        return self
    }

    @discardableResult
    func fill(bottom: CGFloat, from view: UIView, flexible: Bool = false) -> Self {
        fill(bottom: view.topFromBottom + bottom, flexible: flexible)
    }

    @discardableResult
    func flex(to view: UIView, bottom: CGFloat) -> Self {
        self.fill(bottom: bottom, from: view, flexible: true)
    }

    @discardableResult
    func flexToPrevious(bottom: CGFloat) -> Self {
        assert(superview.notNil, "Needs to have superview")
        return superview!.findPrevious(of: self)?.ret {
            self.fill(bottom: bottom, from: $0, flexible: true)
        } ?? self.fill(bottom: bottom, flexible: true)
    }

    @discardableResult
    func fill(top: CGFloat, bottom: CGFloat, flexible: Bool = false) -> Self {
        fill(top: top, flexible: flexible).fill(bottom: bottom, flexible: flexible)
    }

    @discardableResult
    func fill(right: CGFloat, flexible: Bool = false) -> Self {
        assert(superview.notNil, "Needs to have superview")
        let right = superview!.width - right
        widthBy(right: right.asUnsigned)
        if flexible { fixedLeft().flexibleWidth() }
        return self
    }

    @discardableResult
    func fill(right: CGFloat, from view: UIView, flexible: Bool = false) -> Self {
        fill(right: view.leftFromRight + right, flexible: flexible)
    }
}
