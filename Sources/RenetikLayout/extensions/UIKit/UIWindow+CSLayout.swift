//
// Created by Rene Dohan on 3/12/20.
//

public extension UIWindow {

    class func construct(_ controller: UIViewController) -> Self {
        let window: Self = self.construct(defaultSize: true)
        window.rootViewController = controller
        window.makeKeyAndVisible()
        return window
    }

    class var window: UIWindow { Renetik.delegate.window!! }
    class var safeWidth: CGFloat { window.width - (window.safeAreaInsets.left + window.safeAreaInsets.right) }
    class var safeHeight: CGFloat { window.height - (window.safeAreaInsets.top + window.safeAreaInsets.bottom) }

    func show(root controller: UIViewController) -> Self {
        UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = controller
            UIView.setAnimationsEnabled(oldState)
        })
        return self
    }

    var statusBarHeight: CGFloat {
        let statusBarSize = windowScene?.statusBarManager?.statusBarFrame.size ?? .zero
        return min(statusBarSize.width, statusBarSize.height)
    }

    var statusBarBottom: CGFloat { statusBarHeight }
}
