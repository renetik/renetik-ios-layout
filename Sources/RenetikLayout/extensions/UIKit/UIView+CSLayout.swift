//
// Created by Rene Dohan on 12/23/19.
//

import UIKit
import Renetik

public extension UIView {

    @discardableResult
    func from(left: CGFloat) -> Self { self.left = left; fixedLeft(); return self }

    @discardableResult
    func from(_ view: UIView?, left: CGFloat) -> Self {
        from(left: view?.ret { $0.right + left } ?? left)
    }

    @discardableResult
    func fromPrevious(left: CGFloat, skipHidden: Bool = true) -> Self {
        assert(superview.notNil, "Needs to have superview")
        superview!.findPrevious(of: self, skipHidden: skipHidden).notNil { previous in
            from(previous, left: left)
        }.elseDo { from(left: 0) }
        return self
    }

    @discardableResult
    func from(top: CGFloat) -> Self { invoke { self.top = top; fixedTop() } }

    @discardableResult
    func from(safeTop: CGFloat) -> Self {
        assert(superview.notNil, "Needs to have superview")
        return from(top: superview!.safeAreaInsets.top + 0)
    }

    @discardableResult
    func from(_ view: UIView?, top: CGFloat) -> Self { from(top: view?.ret { $0.bottom + top } ?? top) }

    @discardableResult
    func fromPrevious(top: CGFloat) -> Self {
        assert(superview.notNil, "Needs to have superview")
        superview!.findPrevious(of: self).notNil { from($0, top: top) }
            .elseDo { from(top: 0) }
        return self
    }

    @discardableResult
    func fromPrevious(bottom: CGFloat) -> Self {
        assert(superview.notNil, "Needs to have superview")
        superview!.findPrevious(of: self).notNil { from($0, bottom: bottom) }
            .elseDo { from(bottom: 0) }
        return self
    }

    @discardableResult
    func fromLeftAsPrevious(offset: CGFloat = 0) -> Self {
        assert(superview.notNil, "Needs to have superview")
        let previous = superview!.findPrevious(of: self)
        assert(previous.notNil, "Needs to have previous visible")
        from(left: previous!.left + offset)
        return self
    }

    @discardableResult
    func from(right: CGFloat) -> Self { invoke { self.fromRight = right; fixedRight() } }

    @discardableResult
    func fromPrevious(right: CGFloat) -> Self {
        assert(superview.notNil, "Needs to have superview")
        superview!.findPrevious(of: self).notNil { previous in
            from(previous, right: right)
        }.elseDo { from(right: 0) }
        return self
    }

    @discardableResult
    func from(_ view: UIView?, right: CGFloat)
        -> Self { from(right: view?.ret { $0.leftFromRight + right } ?? right) }

    @discardableResult
    func from(bottom: CGFloat) -> Self { invoke { self.fromBottom = bottom; fixedBottom() } }

    @discardableResult
    func from(safeBottom: CGFloat) -> Self {
        assert(superview.notNil, "Needs to have superview")
        if superview?.window != nil {
            // superview is already in view hierarchy
            return from(bottom: superview!.safeAreaInsets.bottom + safeBottom)
        }
        else {
            // superview not in view hierarchy - use default's window bottom inset
            return from(bottom: UIApplication.window?.safeAreaInsets.bottom ?? 0 + safeBottom)
        }
    }

    @discardableResult
    func from(_ view: UIView?, bottom: CGFloat)
        -> Self { from(bottom: view?.ret { $0.topFromBottom + bottom } ?? bottom) }

    @discardableResult
    func from(bottomRight: CGFloat) -> Self { from(bottom: bottomRight, right: bottomRight) }

    @discardableResult
    func from(left: CGFloat, top: CGFloat) -> Self { from(left: left).from(top: top) }

    @discardableResult
    func from(topLeft: CGFloat) -> Self { from(top: topLeft).from(left: topLeft) }

    @discardableResult
    func from(topRight: CGFloat) -> Self { from(top: topRight).from(right: topRight) }

    @discardableResult
    func from(left: CGFloat, bottom: CGFloat) -> Self { from(left: left).from(bottom: bottom) }

    @discardableResult
    func from(bottom: CGFloat, left: CGFloat) -> Self { from(bottom: bottom).from(left: left) }

    @discardableResult
    func from(right: CGFloat, top: CGFloat) -> Self { from(right: right).from(top: top) }

    @discardableResult
    func from(top: CGFloat, right: CGFloat) -> Self { from(top: top).from(right: right) }

    @discardableResult
    func from(right: CGFloat, bottom: CGFloat) -> Self { from(right: right).from(bottom: bottom) }

    @discardableResult
    func from(bottom: CGFloat, right: CGFloat) -> Self { from(bottom: bottom).from(right: right) }

    @discardableResult
    func from(left: CGFloat, top: CGFloat, width: CGFloat, height: CGFloat) -> Self {
        from(left: left, top: top).width(width, height: height)
    }

    @discardableResult
    func matchParent(margin: CGFloat = 0) -> Self {
        matchParent(margin: (horizontal: margin, vertical: margin))
    }

    @discardableResult
    func matchParent(margin: (horizontal: CGFloat, vertical: CGFloat)) -> Self {
        matchParentWidth(margin: margin.horizontal).matchParentHeight(margin: margin.vertical)
    }

    @discardableResult
    func matchParentWidth(margin: CGFloat = 0) -> Self {
        from(left: margin).flex(right: margin)
    }

    @discardableResult
    func matchParentWidth(margin: (left: CGFloat, right: CGFloat)) -> Self {
        from(left: margin.left).flex(right: margin.right)
    }

    @discardableResult
    func matchParentHeight(margin: CGFloat = 0) -> Self {
        from(top: margin).fillTo(bottom: margin)
    }

    @discardableResult
    func asParentHeight(margin: CGFloat = 0) -> Self {
        from(top: margin).fill(bottom: margin, flexible: false)
    }

    @discardableResult
    func matchParentHeight(margin: (top: CGFloat, bottom: CGFloat)) -> Self {
        from(top: margin.top).fill(bottom: margin.bottom, flexible: true)
    }

    @discardableResult
    func fillTo(bottom: CGFloat, flexible: Bool = true) -> Self {
        self.fill(bottom: bottom, flexible: flexible)
    }

    @discardableResult
    func flex(right: CGFloat, flexible: Bool = true) -> Self {
        fill(right: right, flexible: flexible)
    }

    @discardableResult
    func flex(to view: UIView, right: CGFloat) -> Self {
        self.fill(right: right, from: view, flexible: true)
    }

    @discardableResult
    func widthBy(right: CGFloat) -> Self {
        width = (right - left).asUnsigned
        fixedRight()
        return self
    }

    @discardableResult
    func heightBy(bottom: CGFloat) -> Self {
        height = (bottom - top).asUnsigned
        fixedBottom()
        return self
    }

    @discardableResult
    func fixedBottom(height: CGFloat) -> Self {
        let bottom = fromBottom
        self.height = height
        fromBottom = bottom
        fixedBottom()
        return self
    }

    @discardableResult
    func fixedRight(width: CGFloat) -> Self {
        let right = fromRight
        self.width = width
        fromRight = right
        fixedRight()
        return self
    }

    //TODO!!! Write tests and doc
    @discardableResult
    func alignHorizontalLayout() -> Self {
        assert(superview.notNil, "Needs to have superview")
        let previous = superview!.findPrevious(of: self)
        previous.notNil { previous in
            assert(previous.height == height, "Needs to have same height as previous")
            if previous.right + width <= superview!.width {
                from(left: previous.right, top: previous.top)
            }
            else {
                from(left: 0, top: previous.bottom)
            }
        }.elseDo { from(left: 0, top: 0) }
        return self
    }

    //TODO!!! Write tests and doc, almost same as fromPrevious
    @discardableResult
    func alignHorizontal(margin: CGFloat = 0) -> Self {
        assert(superview.notNil, "Needs to have superview")
        superview!.findPrevious(of: self).notNil {
            from(left: $0.right + margin)
        }.elseDo { from(left: margin) }
        return self
    }

    //TODO!!! Write tests and doc
    @discardableResult
    func alignVerticalLayout() -> Self {
        assert(superview.notNil, "Needs to have superview")
        if let previous = superview!.findPrevious(of: self) {
            assert(previous.width == width, "Needs to have same width as previous")
            if previous.bottom + height <= superview!.height {
                from(left: previous.left, top: previous.bottom)
            }
            else {
                from(left: previous.right, top: 0)
            }
        }
        else {
            from(left: 0, top: 0)
        }
        return self
    }

    //TODO!!! Write tests and doc , almost same as fromPrevious
    @discardableResult
    func alignVertical(margin: CGFloat = 0) -> Self {
        assert(superview.notNil, "Needs to have superview")
        if let previous = superview!.findPrevious(of: self) {
            from(top: previous.bottom + margin)
        }
        else {
            from(top: margin)
        }
        return self
    }

    //TODO!!! Write tests and doc
    @discardableResult
    func alignHorizontalGrid(margin: CGFloat = 0, columns: Int = 1) -> Self {
        assert(superview.notNil, "Needs to have superview")
        self.width = (superview!.width - (margin * (CGFloat(columns) + 1))) / CGFloat(columns);
        if let previous = superview!.findPrevious(of: self) {
            if previous.right + margin + self.width + margin <= width {
                from(left: previous.right + margin, top: previous.top)
            }
            else {
                from(left: margin, top: previous.bottom + margin)
            }
        }
        else {
            from(left: margin, top: margin)
        }
        return self
    }

    //TODO!!! Write tests and doc
    @discardableResult
    func alignVerticalGrid(margin: CGFloat = 0, rows: Int = 1) -> Self {
        assert(superview.notNil, "Needs to have superview")
        self.height = (superview!.height - (margin * (CGFloat(rows) + 1))) / CGFloat(rows);
        if let previous = superview!.findPrevious(of: self) {
            if previous.bottom + margin + height + margin <= height {
                from(left: previous.left, top: previous.bottom + margin)
            }
            else {
                from(left: previous.right + margin, top: margin)
            }
        }
        else {
            from(left: margin, top: margin)
        }
        return self
    }


}
