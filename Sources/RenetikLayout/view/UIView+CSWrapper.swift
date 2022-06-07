extension UIView {

    public class func wrap<Wrapped: UIView>(_ view: Wrapped, padding: CGFloat) -> CSWrapper<Wrapped> {
        CSWrapper<Wrapped>.construct().padding(padding).wrap(view)
    }

    public class func wrap<Wrapped: UIView>(_ view: Wrapped, horizontal padding: CGFloat) -> CSWrapper<Wrapped> {
        let wrapper = CSWrapper<Wrapped>.construct()
        wrapper.paddingLeft = padding
        wrapper.paddingRight = padding
        return wrapper.wrap(view)
    }

    public class func wrap<Wrapped: UIView>(_ view: Wrapped, vertical padding: CGFloat) -> CSWrapper<Wrapped> {
        let wrapper = CSWrapper<Wrapped>.construct()
        wrapper.paddingTop = CGFloat(padding)
        wrapper.paddingBottom = CGFloat(padding)
        return wrapper.wrap(view)
    }

    public class func wrap<Wrapped: UIView>(_ view: Wrapped, paddingLeft: CGFloat = 0, paddingRight: CGFloat = 0,
                                            paddingTop: CGFloat = 0, paddingBottom: CGFloat = 0) -> CSWrapper<Wrapped> {
        let wrapper = CSWrapper<Wrapped>.construct()
        wrapper.paddingLeft = paddingLeft
        wrapper.paddingRight = CGFloat(paddingRight)
        wrapper.paddingTop = CGFloat(paddingTop)
        wrapper.paddingBottom = CGFloat(paddingBottom)
        return wrapper.wrap(view)
    }
}
