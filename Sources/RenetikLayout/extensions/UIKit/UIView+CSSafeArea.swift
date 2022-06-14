extension UIView {
    public var topInset: CGFloat { safeArea.top }
    public var bottomInset: CGFloat { safeArea.bottom }
    public var rightInset: CGFloat { window!.isLandscapeLeft ? safeArea.right : 0 }
    public var leftInset: CGFloat { window!.isLandscapeRight ? safeArea.left : 0 }
    public var safeArea: UIEdgeInsets { window?.safeAreaInsets ?? .zero }
}
