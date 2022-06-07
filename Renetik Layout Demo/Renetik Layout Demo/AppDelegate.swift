import RenetikLayout

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    public var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Renetik.initialize()
        window = UIWindow.construct(ViewController())
        return true
    }
}
