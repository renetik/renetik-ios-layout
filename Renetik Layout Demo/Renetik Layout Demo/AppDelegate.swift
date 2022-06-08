import RenetikLayout

var delegate: AppDelegate!

@main
class AppDelegate: CSApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        delegate = self
        self.application(application, launchOptions)
        window = UIWindow.construct(MainViewController())
        return true
    }
}
