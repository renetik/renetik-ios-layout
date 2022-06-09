import RenetikLayout

class MainView: CSView {
    let testSwitch = SwitchButton.construct(icon: .chevron_right, title: "test")
    let titleSubtitle = ImageTitleSubtitleButton.construct()

    override func onCreateLayout() {
        super.onCreateLayout()
        background(.demo_panel)
        add(view: CSView.construct(), onCreate: { [unowned self] in
            $0.add(view: testSwitch).matchParentWidth()
                .background(.demo_control).heightToFit()

            $0.add(view: titleSubtitle, onCreate: {
                $0.matchParentWidth().heightToFit().background(.demo_control)
            }, onLayout: {
                $0.fromPrevious(top: 15)
            })
        }, onLayout: { [unowned self] in
            $0.from(left: leftInset).fill(right: rightInset)
            $0.heightToFit().centeredVertical()
        })
        delegate.onOrientationChange { [unowned self] in updateLayout() }
        //debugLayoutByRandomBackgroundColor()
    }
}

class MainViewController: UIViewController {
    lazy var content = { MainView.construct() }()

    override func loadView() { view = content }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        content.testSwitch.onClick {
            logInfo("testSwitch")
        }
        content.titleSubtitle.onClick {
            logInfo("titleSubtitle")
        }
    }
}

#if DEBUG
import SwiftUI

class MainViewPreview: PreviewProvider, CSPreviewProvider {
    static var dimension: CSPreviewDimension = .iPhone8
    static var isPortrait = true

    class func preview(in view: UIView) {
        view.add(view: MainView.construct()).matchParent()
    }
}
#endif
