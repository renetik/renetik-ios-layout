extension UIView {
    public var safeTop: CGFloat { safeAreaInsets.top }
    public var safeBottom: CGFloat { safeAreaInsets.bottom }
    public var safeRight: CGFloat { window?.isLandscapeLeft == true ? safeAreaInsets.right : 0 }
    public var safeLeft: CGFloat { window?.isLandscapeRight == true ? safeAreaInsets.left : 0 }
//    public var safeArea: UIEdgeInsets { window?.safeAreaInsets ?? .zero }
}
