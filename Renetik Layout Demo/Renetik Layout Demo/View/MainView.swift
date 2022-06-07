import RenetikLayout
import UIKit

class MainView: CSView {
    override func onCreateLayout() {
        super.onCreateLayout()
        background(.demo_control)
        add(view: UILabel.construct(color: .blue).text("Test")
                .text(align: .center).resizeToFit(padding: 30)).centered()
        add(view: SwitchButton.construct(icon: .chevron_right, title: "test"))
            .matchParentWidth().fromPrevious(top: 5)
        //        debugLayoutByRandomBackgroundColor()
    }
}

class MainViewController: UIViewController {
    lazy var content = { MainView.construct() }()
    override func loadView() { view = content }
}

#if DEBUG
    import SwiftUI
    class MainViewPreview: PreviewProvider, CSPreviewProvider {
        class func preview(in view: UIView) {
            view.add(view: MainView.construct())
        }
    }
#endif

