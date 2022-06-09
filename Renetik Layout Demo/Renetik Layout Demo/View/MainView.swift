import RenetikLayout

class MainView: CSView {

    let scrollView = UIScrollView.construct()
    let testSwitch = SwitchButton.construct(
        icon: .chevron_right, title: "test")
    let titleSubtitle = ImageTitleSubtitleButton.construct()
    let headerView = HeaderSectionView.construct()
    let expandView = ExpandSectionView.construct()

    override func onCreateLayout() {
        super.onCreateLayout()
        background(.demo_panel)
        add(view: scrollView).matchParent().add(
            view: CSView.construct(), onCreate: { [unowned self] in
                $0.matchParentWidth()
                $0.add(view: titleSubtitle,
                    onCreate: { $0.matchParentWidth() },
                    onLayout: { $0.fromPrevious(top: 0) })
                $0.add(view: DemoHorizontalLineStrong.construct()).matchParentWidth().fromPrevious(top: 0)

                $0.add(view: testSwitch,
                    onCreate: { $0.matchParentWidth() },
                    onLayout: { $0.fromPrevious(top: 0) })

                $0.add(view: headerView,
                    onCreate: { $0.matchParentWidth() },
                    onLayout: { $0.fromPrevious(top: 15) })

                $0.add(view: expandView,
                    onCreate: { $0.matchParentWidth() },
                    onLayout: { $0.fromPrevious(top: 15) })
            }, onLayout: { [unowned self] in
                $0.from(left: leftInset).fill(right: rightInset)
                    .heightToFit().from(top: topInset)
                scrollView.updateContentSize()
            })

        delegate.onOrientationChange { [unowned self] in
            scrollView.content.updateLayout(forced: true)
        }
        later { [unowned self] in
            scrollView.content.updateLayout(forced: true)
        }
        //debugLayoutByRandomBackgroundColor()
    }
}

//private extension UIScrollView {
//    var content2: UIView { subviews[0] }
//    @discardableResult
//    func updateContentSize() -> Self {
//        contentSize = CGSize(width: content2.right,
//            height: content2.bottom)
//        return self
//    }
//}

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
        static var isPortrait = false

        class func preview(in view: UIView) {
            view.add(view: MainView.construct()).matchParent()
        }
    }
#endif
