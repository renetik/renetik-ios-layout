public extension CSHasLayoutProtocol where Self: UIView {

    static func column(top topView: UIView, margin: CGFloat = 0, bottom bottomView: UIView) -> Self {
        Self.construct(defaultSize: true).also { container in
            container.layout(container.add(view: topView).from(top: 0).matchParentWidth()) {
                $0.heightToFit()
            }
            container.layout(container.add(view: bottomView).matchParentWidth()) {
                $0.fromPrevious(top: margin).heightToFit()
            }
        }.resizeToFit()
    }
}
