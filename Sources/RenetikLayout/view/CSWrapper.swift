open class CSWrapper<Wrapped: UIView>: CSView {

    public var paddingLeft: CGFloat = 0
    public var paddingRight: CGFloat = 0
    public var paddingTop: CGFloat = 0
    public var paddingBottom: CGFloat = 0

    @discardableResult
    public func padding(_ padding: CGFloat) -> Self {
        paddingLeft = CGFloat(padding)
        paddingRight = CGFloat(padding)
        paddingTop = CGFloat(padding)
        paddingBottom = CGFloat(padding)
        updateWrap()
        return self
    }

    @discardableResult
    public func padding(horizontal: CGFloat, vertical: CGFloat) -> Self {
        paddingLeft = CGFloat(horizontal)
        paddingRight = CGFloat(horizontal)
        paddingTop = CGFloat(vertical)
        paddingBottom = CGFloat(vertical)
        updateWrap()
        return self
    }

    @discardableResult
    public func padding(horizontal: CGFloat) -> Self {
        paddingLeft = CGFloat(horizontal)
        paddingRight = CGFloat(horizontal)
        updateWrap()
        return self
    }

    @discardableResult
    public func padding(vertical: CGFloat) -> Self {
        paddingTop = CGFloat(vertical)
        paddingBottom = CGFloat(vertical)
        updateWrap()
        return self
    }

    @discardableResult
    public func padding(left: CGFloat) -> Self {
        paddingLeft = CGFloat(left)
        updateWrap()
        return self
    }

    @discardableResult
    public func padding(left: CGFloat? = nil, right: CGFloat? = nil, top: CGFloat? = nil, bottom: CGFloat? = nil) -> Self {
        left?.also { paddingLeft = CGFloat($0) }
        right?.also { paddingRight = CGFloat($0) }
        top?.also { paddingTop = CGFloat($0) }
        bottom?.also { paddingBottom = CGFloat($0) }
        updateWrap()
        return self
    }

    @discardableResult
    public func padding(right: CGFloat) -> Self {
        paddingRight = CGFloat(right)
        updateWrap()
        return self
    }

    @discardableResult
    public func padding(top: CGFloat) -> Self {
        paddingTop = CGFloat(top)
        updateWrap()
        return self
    }

    @discardableResult
    public func padding(bottom: CGFloat) -> Self {
        paddingBottom = CGFloat(bottom)
        updateWrap()
        return self
    }

    public static func construct(_ view: Wrapped) -> Self { construct().wrap(view) }

    @discardableResult
    public func wrap(_ view: Wrapped) -> Self {
        add(view: view,
            onCreate: { [unowned self] _ in updateWrap() },
            onLayout: { [unowned self] in
                $0.from(left: paddingLeft).fill(right: paddingRight)
                    .from(top: paddingTop).fill(bottom: paddingBottom)
            })
//        debugLayoutByRandomBackgroundColor()
        updateWrap()
        return self
    }

    public var wrapped: Wrapped { subviews[0] as! Wrapped }

    @discardableResult
    public func updateWrap() -> Self {
        if subviews.isEmpty { return self }
//        updateLayout() //TODO: test if this is anough
        width(paddingLeft + paddingRight + wrapped.width)
        height(paddingTop + paddingBottom + wrapped.height)
        return self
    }

    @discardableResult
    public func updateWrapped(_ closure: (Wrapped) -> Void) -> Self {
        updateLayout()
        closure(wrapped)
        updateWrap()
        return self
    }

    @discardableResult
    open override func heightToFit() -> Self {
        wrapped.heightToFit()
        super.heightToFit().add(height: paddingTop + paddingBottom)
        return self
    }

    public override func widthToFit() -> Self {
        wrapped.widthToFit()
        super.widthToFit().add(width: paddingLeft + paddingRight)
        return self
    }
}
