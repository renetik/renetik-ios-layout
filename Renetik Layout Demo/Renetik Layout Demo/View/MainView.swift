import RenetikLayout
import UIKit

class MainView: CSView {
    override func onCreateLayout() {
        super.onCreateLayout()
        background(.demo_panel)
        add(view: SwitchButton.construct(icon: .chevron_right, title: "test"))
            .matchParentWidth().centered()
            .background(.demo_control)
        
        add(view: ImageTitleSubtitleButton.construct())
            .matchParentWidth().fromPrevious(top: 5)
            .background(.demo_control)
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

