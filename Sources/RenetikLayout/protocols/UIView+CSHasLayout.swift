extension UIView: CSHasLayoutProtocol {

    public var layoutFunctions: CSEvent<Void> { associated("layoutFunctions") { event() } }

    public var eventLayoutSubviewsFirstTime: CSEvent<Void> { associated("eventLayoutSubviewsFirstTime") { event() } }

    public var isDidLayoutSubviews: Bool {
        get { (associatedDictionary["isDidLayoutSubviews"] as? Bool) ?? false }
        set { associatedDictionary["isDidLayoutSubviews"] = newValue }
    }
    public var isLayoutCreated: Bool {
        get { (associatedDictionary["isLayoutCreated"] as? Bool) ?? false }
        set { associatedDictionary["isLayoutCreated"] = newValue }
    }
    private var viewLayoutFunctions: CSDictionary<String, CSRegistration> {
        associated("viewLayoutFunctions") { CSDictionary<String, CSRegistration>() }
    }

    func onLayoutSubviews() {
        if !isDidLayoutSubviews {
            isDidLayoutSubviews = true
            onLayoutSubviewsFirstTime()
            if (!isLayoutCreated) {
                onCreateLayout()
                onLayoutCreated()
            }
            eventLayoutSubviewsFirstTime.fire()
        }
        else {
            onUpdateLayout()
        }
        updateLayout()
    }

    @objc open func onLayoutSubviewsFirstTime() {
    }

    @objc open func onCreateLayout() {
        isLayoutCreated = true
    }

    @objc open func onLayoutCreated() { }

    @objc open func onUpdateLayout() { }

    @discardableResult
    @objc open func updateLayout() -> Self { layoutFunctions.fire(); return self }

    @discardableResult
    public func updateLayout(forced: Bool = false) -> Self {
        forced ? updateLayoutForced() : updateLayout()
    }

    @discardableResult
    public func updateLayoutForced() -> Self {
        var view: UIView? = self
        while view.notNil {
            view!.updateLayout()
            view = view!.superview
        }
        return self
    }

    @discardableResult
    public func updateLayoutLater(forced: Bool = false) -> Self {
        later(seconds: 0.15) { [unowned self] in updateLayout(forced: forced) }
        return self
    }

    public func remove<View: UIView>(view: View) {
        if view.superview != self {
            logError("view is not in this parent")
            return
        }
        viewLayoutFunctions.remove(key: view.hashString)?.cancel()
        view.removeFromSuperview()
    }

    @discardableResult
    public func add<View: UIView>(
        view: View,
        onCreate: ArgFunc<View>? = nil,
        onLayout: @escaping ArgFunc<View>) -> View {
        add(view: view)
        view.layoutSubviews()
        onCreate?(view)
        viewLayoutFunctions.add(view.hashString, layoutFunctions.listen {
                view.layoutSubviews()
                onLayout(view)
            })
        onLayout(view)
        return view
    }

    @discardableResult
    public func add<View: UIView>(
        view: View,
        onCreate: Func? = nil,
        onLayout: @escaping Func) -> View {
        add(view: view)
        view.layoutSubviews()
        onCreate?()
        viewLayoutFunctions.add(view.hashString, layoutFunctions.listen {
                view.layoutSubviews()
                onLayout()
            })
        onLayout()
        return view
    }

    @discardableResult
    public func layout<View: UIView>(_ view: View, onLayout: @escaping (View) -> Void) -> View {
        viewLayoutFunctions.add(view.hashString, layoutFunctions.listen {
                view.layoutSubviews()
                onLayout(view)
            })
        view.layoutSubviews()
        onLayout(view)
        return view
    }

    @discardableResult
    public func layout(function: @escaping Func) -> Self {
        layoutFunctions.listen { function() }
        function()
        return self
    }

    @discardableResult
    public func layout(function: @escaping (Self) -> Void) -> Self {
        layoutFunctions.listen { [unowned self] in function(self) }
        function(self)
        return self
    }

    public func removeFromLayout() {
        superview!.remove(view: self)
    }
}
