//
// Created by Rene Dohan on 1/29/20.
//

import UIKit

//private var viewContentPropertyKey: UInt8 = 0
private var viewContentPropertyKey: Void?

public extension UIView {

    class func wrap(view: UIView, padding: CGFloat = 0) -> Self { //TODO remove
        Self.construct(defaultSize: true).also { $0.content(view).matchParent(margin: padding) }
    }

    var content: UIView? {
        get { weakAssociated("content") }
        set(view) {
            content?.removeFromSuperview()
            weakAssociate("content", view)
            view.notNil { addSubview($0) }
        }
    }

    @discardableResult
    func content<View: UIView>(_ view: View) -> View { content = view; return view }

    class func withContent(_ view: UIView = CSView.construct()) -> Self {
        let container = self.construct(frame: view.frame)
        container.content(view).matchParent()
        return container
    }

    @discardableResult
    func withContent(_ view: UIView = CSView.construct()) -> Self {
        content(view).matchParent()
        return self
    }

    @discardableResult
    func contentVertical(padding: CGFloat) -> Self {
        let masks = saveAndClearSubviewsAutoresizingMasks()
        height = content!.height + 2 * padding
        content!.centeredVertical()
        restoreSubviewsAutoresizing(masks: masks)
        return self
    }

    @discardableResult
    func contentHorizontal(padding: CGFloat) -> Self {
        let masks = saveAndClearSubviewsAutoresizingMasks()
        width = content!.width + 2 * padding
        content!.centeredHorizontal()
        restoreSubviewsAutoresizing(masks: masks)
        return self
    }

    @discardableResult
    func content(padding: CGFloat) -> Self {
        contentHorizontal(padding: padding)
        contentVertical(padding: padding)
        return self
    }

    @discardableResult
    func content(padding: (horizontal: CGFloat, vertical: CGFloat)) -> Self {
        contentHorizontal(padding: padding.horizontal)
        contentVertical(padding: padding.vertical)
        return self
    }

    @discardableResult
    func content(margin: CGFloat) -> Self {
        let masks = saveAndClearSubviewsAutoresizingMasks()
        content!.matchParent(margin: margin)
        restoreSubviewsAutoresizing(masks: masks)
        return self
    }

    @discardableResult
    func contentVertical(margin: CGFloat) -> Self {
        let masks = saveAndClearSubviewsAutoresizingMasks()
        content!.matchParentHeight(margin: margin)
        restoreSubviewsAutoresizing(masks: masks)
        return self
    }

    @discardableResult
    func contentHorizontal(margin: CGFloat) -> Self {
        let masks = saveAndClearSubviewsAutoresizingMasks()
        content!.matchParentWidth(margin: margin)
        restoreSubviewsAutoresizing(masks: masks)
        return self
    }
}