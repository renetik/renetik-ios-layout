extension UIView {
    public var topInset: CGFloat { window?.safeAreaInsets.top ?? 0 }
    public var bottomInset: CGFloat { window?.safeAreaInsets.bottom ?? 0 }
    public var rightInset: CGFloat { UIScreen.isLandscapeLeft ? window?.safeAreaInsets.right ?? 0 : 0 }
    public var leftInset: CGFloat { UIScreen.isLandscapeRight ? window?.safeAreaInsets.left ?? 0 : 0 }
}
