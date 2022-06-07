extension UIViewController {
    
    @discardableResult
    public func add(controller: UIViewController) -> UIViewController {
        add(controller: controller, to: view)
    }
    
    @discardableResult
    public  func add(controller: UIViewController, to parenView: UIView) -> UIViewController {
        addChild(controller)
        parenView.add(view: controller.view)
        controller.didMove(toParent: self)
        //        (controller as? CSViewController)?.isShowing = true //TODO
        return controller
    }
    
    @discardableResult
    @objc open func dismissChild(controller: UIViewController) -> UIViewController {
        controller.willMove(toParent: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParent()
        //        (controller as? CSMainController)?.isShowing = false //TODO
        return controller
    }
}
