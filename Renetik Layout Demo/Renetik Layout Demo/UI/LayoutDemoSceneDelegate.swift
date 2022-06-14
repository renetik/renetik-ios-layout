import RenetikFramework

var delegate: LayoutDemoSceneDelegate?

class LayoutDemoSceneDelegate: CSWindowSceneDelegate {
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        delegate = self
        window = UIWindow(windowScene: scene)
        window!.rootViewController = MainViewController()
        window!.makeKeyAndVisible()
    }
}
