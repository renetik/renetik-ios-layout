import RenetikLayout

class LayoutDemoSceneDelegate: CSWindowSceneDelegate {
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window!.rootViewController = MainViewController()
        window!.makeKeyAndVisible()
    }
}
