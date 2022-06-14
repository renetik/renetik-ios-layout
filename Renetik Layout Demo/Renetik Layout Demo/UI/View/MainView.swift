import RenetikLayout

class MainView: CSView {
    override class func construct() -> Self {
        super.construct().background(.demo_panel)
    }
    let scrollView = CSScrollView.construct()
    let titleSubtitle = ImageTitleSubtitleButton.construct()
    let testSwitch = SwitchButton.construct(
        icon: .chevron_right, title: "test")
    let expandView = ExpandSectionView.construct()
    let headerView = HeaderSectionView.construct()

    override func onCreate() {
        super.onCreate()
        add(view: scrollView, onCreate: {
            $0.matchParent()
            $0.add(view: CSView.construct(), onCreate: { [unowned self] in
                    $0.add(view: titleSubtitle,
                        onCreate: { $0.matchParentWidth() },
                        onLayout: { $0.fromPrevious(top: 0) })
                    $0.add(view: HorizontalLineStrong.construct())
                        .matchParentWidth().fromPrevious(top: 0)
                    $0.add(view: testSwitch,
                        onCreate: { $0.matchParentWidth() },
                        onLayout: { $0.fromPrevious(top: 0) })
                    $0.add(view: expandView,
                        onCreate: { $0.matchParentWidth() },
                        onLayout: { $0.fromPrevious(top: 15) })
                    $0.add(view: headerView,
                        onCreate: { $0.matchParentWidth() },
                        onLayout: { $0.fromPrevious(top: 15) })
                }, onLayout: { [unowned self] in
                    $0.from(left: leftInset).fill(right: rightInset)
                        .from(top: topInset).heightToFit()
                })
        }, onLayout: { $0.updateContentSize() })
    }
}
#if DEBUG
    import SwiftUI
    class MainViewPreview: PreviewProvider, CSPreviewProvider {
        static var dimension: CSPreviewDimension = .iPhone8
        static var isPortrait = true
        class func preview(in window: UIView) {
            window.add(view: MainView.construct()).matchParent()
        }
    }
#endif
