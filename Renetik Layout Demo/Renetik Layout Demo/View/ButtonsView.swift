import RenetikLayout

class ButtonsView: CSView {

    override class func construct() -> Self {
        super.construct().background(color: .demo_control)
    }

    let upgradeButton = IconTextButton.construct(
        icon: .chevron_right, title: "Move")
    let supportButton = IconTextButton.construct(
        icon: .chevron_right, title: "Resize")
    let themeButton = IconTextButton.construct(
        icon: .chevron_right, title: "Scales")
    let settingsButton = IconTextButton.construct(
        icon: .chevron_right, title: "Type")

    override func onCreateLayout() {
        super.onCreateLayout()
        add(view: CSView.construct(),
            onCreate: { [unowned self] horizontalView in
                horizontalView.fromPrevious(top: 0).matchParentWidth().height(60)
                horizontalView.add(view: upgradeButton,
                    onCreate: { $0.from(left: 0).matchParentHeight() },
                    onLayout: { [unowned self] in $0.width((horizontalView.width - rightInset) / 2) })
                horizontalView.add(view: DemoVerticalLine.constructMedium(),
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0) })
                horizontalView.add(view: supportButton,
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0).width(horizontalView.width / 2) })
            })
        add(view: DemoHorizontalLineStrong.constructMedium())
            .fromPrevious(top: 0).matchParentWidth()
        add(view: CSView.construct(),
            onCreate: { [unowned self] horizontalView in
                horizontalView.fromPrevious(top: 0).matchParentWidth().height(60)
                horizontalView.add(view: themeButton,
                    onCreate: { $0.from(left: 0).matchParentHeight() },
                    onLayout: { [unowned self] in $0.width((horizontalView.width - rightInset) / 2) })
                horizontalView.add(view: DemoVerticalLine.constructMedium(),
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0) })
                horizontalView.add(view: settingsButton,
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0).fill(right: 0) })
            })
        heightByLastSubview()
        delegate.onOrientationChange { [unowned self] in updateLayout() }
    }

    override func onLayoutCreated() {
        super.onLayoutCreated()
        upgradeButton.onClick { logInfo() }
        supportButton.onClick { logInfo() }
        themeButton.onClick { logInfo() }
        settingsButton.onClick { logInfo() }
    }
}

#if DEBUG
    import SwiftUI
    class ButtonsViewPreview: PreviewProvider, CSPreviewProvider {
        class func preview(in view: UIView) {
            view.add(view: ButtonsView.construct())
                .matchParentWidth().heightToFit()
        }
    }
#endif
