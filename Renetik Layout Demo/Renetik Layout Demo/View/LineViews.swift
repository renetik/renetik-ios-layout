import RenetikLayout

class VerticalLine: CSWrapper<UIView> {
    override class func construct() -> Self {
        super.construct().wrap(UIView.construct(
            color: .demo_border).width(.line_width))
    }

    class func constructMedium() -> Self {
        construct().padding(vertical: 10)
    }
}

class VerticalLineStrong: CSWrapper<UIView> {
    override class func construct() -> Self {
        super.construct().wrap(UIView.construct(
            color: .demo_border_strong).width(.line_width))
    }

    class func constructMedium() -> Self {
        construct().padding(vertical: 10)
    }
}

class HorizontalLine: CSWrapper<UIView> {
    override class func construct() -> Self {
        super.construct().wrap(UIView.construct(
            color: .demo_border).height(.line_width))
    }

    class func constructMedium() -> Self {
        construct().padding(horizontal: 10)
    }
}

class HorizontalLineStrong: CSWrapper<UIView> {
    override class func construct() -> Self {
        super.construct().wrap(UIView.construct(
            color: .demo_border_strong).height(.line_width))
    }

    class func constructMedium() -> Self {
        construct().padding(horizontal: 10)
    }
}
