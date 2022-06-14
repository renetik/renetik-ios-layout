import RenetikEvent
open class CSView: UIControl, CSEventOwnerHasDestroy {

    @discardableResult
    open override class func construct() -> Self { construct(defaultSize: true) }

    @discardableResult
    public class func construct(_ function: ArgFunc<CSView>) -> Self {
        let _self = construct(defaultSize: true)
        function(_self)
        return _self
    }

    @discardableResult
    override open func construct() -> Self {
        super.construct().defaultSize()
        return self
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        onLayoutSubviews()
    }

    @discardableResult
    open override func heightToFit() -> Self {
        heightToFitSubviews()
        return self
    }

    @discardableResult
    open override func resizeToFit() -> Self {
        resizeToFitSubviews()
        return self
    }

    @objc open override func onLayoutSubviewsFirstTime() {
        register(window?.orientationChange.listen { [unowned self] in updateLayout() })
    }

    public var eventDestroy = event()
    public let registrations = CSRegistrations()

    deinit {
        registrations.cancel()
        eventDestroy.fire().clear()
    }
}
