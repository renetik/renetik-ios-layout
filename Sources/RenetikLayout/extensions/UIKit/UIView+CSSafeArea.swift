extension UIView {
    public var topInset: CGFloat { safeAreaInsets.top }
    public var bottomInset: CGFloat { safeAreaInsets.bottom }
    public var rightInset: CGFloat { window?.isLandscapeLeft == true ? safeAreaInsets.right : 0 }
    public var leftInset: CGFloat { window?.isLandscapeRight == true ? safeAreaInsets.left : 0 }
//    public var safeArea: UIEdgeInsets { window?.safeAreaInsets ?? .zero }
//    public var safeArea: UIEdgeInsets { window?.safeAreaInsets ?? .zero }
}
