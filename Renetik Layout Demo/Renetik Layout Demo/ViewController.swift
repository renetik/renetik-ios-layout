import RenetikLayout

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        logInfo("test")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.background(.demo_control)
        view.add(view: UILabel.construct(color: .blue).text("Test")
            .text(align: .center).resizeToFit(padding: 30)).centered()
        view.add(view: SwitchButton.construct(icon: .chevron_right, title: "test"))
            .matchParentWidth().fromPrevious(top: 5)
//        view.debugLayoutByRandomBackgroundColor()
    }
}

