import UIKit
public protocol CSHasLayoutProtocol {
    var layoutFunctions: CSEvent<Void> { get }
    func updateLayout() -> Self
    func onLayoutSubviewsFirstTime()
    func onCreateLayout()
    func onLayoutCreated()
    func onUpdateLayout()
}

public protocol CSLayoutItemProtocol {
    var isVisibleToLayout: Bool { get }
}

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
    
    @objc open func onLayoutSubviewsFirstTime() {}
    
    @objc open func onCreateLayout() {
        isLayoutCreated = true
    }
    
    @objc open func onLayoutCreated() {}
    
    @objc open func onUpdateLayout() {}
    
    @discardableResult
    @objc open func updateLayout() -> Self { layoutFunctions.fire(); return self }
    
    @discardableResult
    public func updateLayout(forced:Bool = false) -> Self {
        forced ? updateLayoutForced() : updateLayout()
    }
    
    @discardableResult
    public func updateLayoutForced() -> Self {
        var view:UIView? = self
        while view.notNil {
            view!.updateLayout()
            view = view!.superview
        }
        return self
    }
    
    @discardableResult
    public func updateLayoutLater(forced:Bool = false) -> Self {
        later(seconds: 0.15) { [unowned self] in updateLayout(forced: forced) }
        return self
    }
    
    @discardableResult
    public func add<View: UIView>(
        view: View,
        onCreate: ArgFunc<View>? = nil,
        onLayout: @escaping ArgFunc<View>) -> View {
            add(view: view)
            onCreate?(view)
            layoutFunctions.listen {
                view.layoutSubviews()
                onLayout(view)
            }
            view.layoutSubviews()
            onLayout(view)
            return view
        }
    
    @discardableResult
    public func add<View: UIView>(
        view: View,
        onCreate: Func? = nil,
        onLayout: @escaping Func) -> View {
            add(view: view)
            onCreate?()
            layoutFunctions.listen {
                view.layoutSubviews()
                onLayout()
            }
            view.layoutSubviews()
            onLayout()
            return view
        }
    
    @discardableResult
    public func layout<View: UIView>(_ view: View, onLayout: @escaping (View) -> Void) -> View {
        layoutFunctions.listen {
            view.layoutSubviews()
            onLayout(view)
        }
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
}

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
