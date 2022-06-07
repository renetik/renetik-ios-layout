extension UIView {
    public var rightInset: CGFloat { UIScreen.isLandscapeLeft ? window?.safeAreaInsets.right ?? 0 : 0 }
    public var leftInset: CGFloat { UIScreen.isLandscapeRight ? window?.safeAreaInsets.left ?? 0 : 0 }
}