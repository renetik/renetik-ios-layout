public extension CSHasLayoutProtocol where Self: UIView {

    static func row(fixed leftView: UIView, margin: CGFloat = 0, sizedToFit rightView: UIView) -> Self {
        Self.construct().also { container in
            container.layout(container.add(view: leftView).from(left: 0)) {
                $0.centeredVertical()
            }
            container.layout(container.add(view: rightView).fromPrevious(left: margin)) {
                $0.resizeToFit().centeredVertical()
            }
        }.resizeToFit()
    }

    func row(fixed leftView: UIView, margin: CGFloat = 0, sizedToFit rightView: UIView) -> UIView {
        CSView.row(fixed: leftView, margin: margin, sizedToFit: rightView)
    }

    static func row(flexible leftView: UIView, margin: CGFloat = 0, flexible rightView: UIView) -> Self {
        Self.construct().also { container in
            container.layout(container.add(view: leftView).from(left: 0)) {
                $0.width((container.width - margin) / 2).heightToFit()
            }
            container.layout(container.add(view: rightView)) {
                $0.fromPrevious(left: margin).width((container.width - margin) / 2).heightToFit()
            }
        }
    }

    func row(flexible leftView: UIView, margin: CGFloat = 0, flexible rightView: UIView) -> CSView {
        CSView.row(flexible: leftView, margin: margin, flexible: rightView)
    }

    static func row(flexible leftView: UIView, margin: CGFloat = 0, fixed rightView: UIView) -> Self {
        Self.construct().also { container in
            container.add(view: rightView).from(right: 0).centeredVertical()
            container.layout(container.add(view: leftView).from(left: 0).flex(to: rightView, right: margin)) {
                $0.heightToFit().centeredVertical()
            }
        }.resizeToFit()
    }

    func row(flexible leftView: UIView, margin: CGFloat = 0, fixed rightView: UIView) -> CSView {
        CSView.row(flexible: leftView, margin: margin, fixed: rightView)
    }

    static func row(fixed leftView: UIView, margin: CGFloat = 0, flexible rightView: UIView) -> Self {
        Self.construct(defaultSize: true).also { container in
            container.add(view: leftView).from(left: 0).centeredVertical()
            container.layout(container.add(view: rightView).fromPrevious(left: margin).flex(right: 0)) {
                $0.heightToFit().centeredVertical()
            }
        }.resizeToFit()
    }

    func row(fixed leftView: UIView, margin: CGFloat = 0, flexible rightView: UIView) -> CSView {
        CSView.row(fixed: leftView, margin: margin, flexible: rightView)
    }
}
