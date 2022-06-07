import RenetikLayout

class DemoVerticalLine: CSWrapper<UIView> {
    override class func construct() -> Self {
        super.construct().wrap(
            UIView.construct(color: .demo_border).width(.line_width))
    }

    class func constructMedium() -> Self {
        construct().padding(vertical: 10)
    }
}

class DemoVerticalLineStrong: CSWrapper<UIView> {
    override class func construct() -> Self {
        super.construct().wrap(
            UIView.construct(color: .demo_border_strong).width(.line_width))
    }

    class func constructMedium() -> Self {
        construct().padding(vertical: 10)
    }
}

class DemoHorizontalLine: CSWrapper<UIView> {
    override class func construct() -> Self {
        super.construct().wrap(
            UIView.construct(color: .demo_border).height(.line_width))
    }

    class func constructMedium() -> Self {
        construct().padding(horizontal: 10)
    }
}

class DemoHorizontalLineStrong: CSWrapper<UIView> {
    override class func construct() -> Self {
        super.construct().wrap(
            UIView.construct(color: .demo_border_strong).height(.line_width))
    }

    class func constructMedium() -> Self {
        construct().padding(horizontal: 10)
    }
}
