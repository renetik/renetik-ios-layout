import RenetikLayout

class MainViewController: UIViewController {
    lazy var content = { MainView.construct() }()
    override func loadView() { view = content }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        content.testSwitch.isChecked.listen { [unowned self] in
            show(message: "testSwitch \($0.asString)")
        }
        content.titleSubtitle.onClick { [unowned self] in
            show(message: "titleSubtitle")
        }
        content.headerView.buttons.moveButton.onClick { [unowned self] in
            show(message: "App Move")
        }
        content.headerView.buttons.resizeButton.onClick { [unowned self] in
            show(message: "App Move")
        }
        content.headerView.buttons.scalesButton.onClick { [unowned self] in
            show(message: "App Move")
        }
        content.headerView.buttons.typeButton.onClick { [unowned self] in
            show(message: "App Type")
        }
        content.expandView.buttons.moveButton.onClick { [unowned self] in
            show(message: "Configuration move")
        }
        content.expandView.buttons.resizeButton.onClick { [unowned self] in
            show(message: "Configuration Resize")
        }
        content.expandView.buttons.scalesButton.onClick { [unowned self] in
            show(message: "Configuration Scales")
        }
        content.expandView.buttons.typeButton.onClick { [unowned self] in
            show(message: "TConfiguration Type")
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
