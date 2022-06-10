import RenetikLayout

class MainView: CSView {
    override class func construct() -> Self {
        super.construct().background(.demo_panel)
    }
    let scrollView = UIScrollView.construct()
    let titleSubtitle = ImageTitleSubtitleButton.construct()
    let testSwitch = SwitchButton.construct(
        icon: .chevron_right, title: "test")
    let headerView = HeaderSectionView.construct()
    let expandView = ExpandSectionView.construct()

    override func onCreateLayout() {
        super.onCreateLayout()
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
