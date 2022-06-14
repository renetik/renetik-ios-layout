public extension UIScrollView {

    override class func construct() -> Self {
        super.construct().also { $0.contentInsetAdjustmentBehavior = .never }
    }

    var content: UIView { subviews[0] }

    @discardableResult
    func updateContentSize() -> Self {
        contentSize = CGSize(width: content.right, height: content.bottom)
        return self
    }

//    class func construct(verticalContent: Bool) -> Self {
//        verticalContent ? Self.construct(defaultSize: true).also {
//            $0.content(vertical: CSView.construct())
//        } : Self.construct()
//    }

//    class func construct(horizontalContent: Bool) -> Self {
//        horizontalContent ? Self.construct(defaultSize: true).also {
//            $0.content(horizontal: CSView.construct())
//        } : Self.construct()
//    }

//    @discardableResult
//    func content<View: UIView>(horizontal view: View) -> View {
//        content(view).matchParentHeight().from(left: 0)
//        contentWidthByLastContentSubview()
//        return view
//    }

//    @discardableResult
//    func content<View: UIView>(vertical view: View) -> View {
//        content(view).matchParentWidth().from(top: 0)
//        contentHeightByLastVisibleSubview()
//        return view
//    }

//    @discardableResult
//    func contentWidthByLastContentSubview(padding: CGFloat = 0) -> Self {
//        content(width: (content!.subviews.last?.right ?? 0) + padding)
//    }

//    @discardableResult
//    func content(width: CGFloat) -> Self {
//        content!.width = width
//        if content!.width < self.width {
//            content!.width = self.width
//            isScrollEnabled = false
//        } else {
//            contentSize(width: content!.right)
//            isScrollEnabled = true
//        }
//        return self
//    }

//    @discardableResult
//    func contentSize(width: CGFloat) -> Self {
//        contentSize = CGSize(width: width, height: contentSize.height)
//        return self
//    }

//    @discardableResult
//    func contentHeightByLastVisibleSubview(padding: CGFloat = 0) -> Self {
//        content(height: (content!.lastVisibleSubview?.bottom ?? 0) + padding)
//    }

//    @discardableResult
//    func content(height: CGFloat) -> Self {
//        content!.height = height
    //TODO: Was Needed For What? bouncing? not needed?
    //        if content!.height <= self.height {
    //            content!.height = self.height
    //            isScrollEnabled = false
    //        } else {
    //            isScrollEnabled = true
    //        }
//        contentSize(height: content!.bottom)
//        return self
//    }

//    @discardableResult
//    func contentOffset(top: CGFloat, animated: Bool = true) -> Self {
//        invoke(animated: animated) {
//            self.contentOffset = CGPoint(left: self.contentOffset.left, top: top)
//        }
//        return self
//    }
//
//    @discardableResult
//    func contentOffset(left: CGFloat, animated: Bool = true) -> Self {
//        invoke(animated: animated) {
//            self.contentOffset = CGPoint(left: left, top: self.contentOffset.top)
//        }
//        return self
//    }
}

public extension CSHasLayoutProtocol where Self: UIScrollView {

    @discardableResult
    func layout<View: UIView>(footer view: View, margin: CGFloat, function: @escaping ArgFunc<View>) -> View {
        layout { [unowned self] in
            function(view)
            if view.bottom < safeHeight {
                view.flexibleTop().from(safeBottom: 0) //navigation.navigationBar.bottom
            } else {
                contentSize(height: view.bottom)
            }
        }
        return view
    }

    @discardableResult
    func layout<View: UIView>(footer view: View, margin: CGFloat) -> View {
        layout(footer: view, margin: margin) { $0.fromPrevious(top: margin).heightToFit() }
    }
}

