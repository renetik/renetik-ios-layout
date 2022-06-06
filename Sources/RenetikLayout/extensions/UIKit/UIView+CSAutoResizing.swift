//
// Created by Rene Dohan on 3/10/20.
//

import UIKit

public extension UIView {

    @discardableResult
    func setAutoresizingDefaults() -> Self {
        translatesAutoresizingMaskIntoConstraints = true
        autoresizingMask = []
        flexibleLeft().flexibleTop().flexibleRight().flexibleBottom()
                .fixedWidth().fixedHeight()
        return self
    }

    @discardableResult
    func flexibleLeftTop() -> Self { flexibleLeft().flexibleTop() }

    @discardableResult
    func flexibleLeftBottom() -> Self { flexibleLeft().flexibleBottom() }

    @discardableResult
    func flexibleWidthHeight() -> Self { flexibleWidth().flexibleHeight() }

    @discardableResult
    func flexibleWidth() -> Self {
        autoresizingMask.insert(.flexibleWidth)
        return self
    }

    @discardableResult
    func flexibleHeight() -> Self {
        autoresizingMask.insert(.flexibleHeight)
        return self
    }

    @discardableResult
    func fixedWidth() -> Self {
        autoresizingMask.remove(.flexibleWidth)
        return self
    }

    @discardableResult
    func fixedHeight() -> Self {
        autoresizingMask.remove(.flexibleHeight)
        return self
    }

    @discardableResult
    func flexibleLeft() -> Self {
        autoresizingMask.insert(.flexibleLeftMargin)
        return self
    }

    @discardableResult
    func flexibleTop() -> Self {
        autoresizingMask.insert(.flexibleTopMargin)
        return self
    }

    @discardableResult
    func flexibleRight() -> Self {
        autoresizingMask.insert(.flexibleRightMargin)
        return self
    }

    @discardableResult
    func flexibleBottom() -> Self {
        autoresizingMask.insert(.flexibleBottomMargin)
        return self
    }

    @discardableResult
    func fixedLeft() -> Self {
        autoresizingMask.remove(.flexibleLeftMargin)
        return self
    }

    @discardableResult
    func fixedTop() -> Self {
        autoresizingMask.remove(.flexibleTopMargin)
        return self
    }

    @discardableResult
    func fixedRight() -> Self {
        autoresizingMask.remove(.flexibleRightMargin)
        return self
    }

    @discardableResult
    func fixedBottom() -> Self {
        autoresizingMask.remove(.flexibleBottomMargin)
        return self
    }

    func isFixedLeft() -> Bool { autoresizingMask.contains(.flexibleLeftMargin) }

    func isFixedTop() -> Bool { !autoresizingMask.contains(.flexibleTopMargin) }

    func isFixedRight() -> Bool { !autoresizingMask.contains(.flexibleRightMargin) }

    func isFixedBottom() -> Bool { !autoresizingMask.contains(.flexibleBottomMargin) }
}
