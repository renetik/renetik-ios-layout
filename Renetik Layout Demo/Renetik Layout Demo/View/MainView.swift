import RenetikLayout

class MainView: CSView {
    override func onCreateLayout() {
        super.onCreateLayout()
        background(.demo_panel)
        add(view: CSView.construct(), onCreate: {
            $0.matchParentWidth()
            $0.add(view: SwitchButton.construct(icon: .chevron_right, title: "test"))
                .matchParentWidth()
                .background(.demo_control).heightToFit()
            
            $0.add(view: ImageTitleSubtitleButton.construct(), onCreate: {
                $0.matchParentWidth().heightToFit().background(.demo_control)
            }, onLayout: {
                $0.fromPrevious(top: 15)
            })
        }, onLayout: {
            $0.heightToFit().centeredVertical()
        })
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
    static var dimension: CSPreviewDimension = .iPhone8
    static var isPortrait = false
    class func preview(in view: UIView) {
        view.add(view: MainView.construct()).matchParent()
    }
}
#endif
