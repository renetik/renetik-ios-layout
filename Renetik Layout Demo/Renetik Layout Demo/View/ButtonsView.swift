import RenetikLayout

class ButtonsView: CSView {

    override class func construct() -> Self {
        super.construct().background(color: .demo_control)
    }

    let moveButton = IconTextButton.construct(
        icon: .chevron_right, title: "Move")
    let resizeButton = IconTextButton.construct(
        icon: .chevron_right, title: "Resize")
    let scalesButton = IconTextButton.construct(
        icon: .chevron_right, title: "Scales")
    let typeButton = IconTextButton.construct(
        icon: .chevron_right, title: "Type")

    override func onCreateLayout() {
        super.onCreateLayout()
        add(view: CSView.construct(),
            onCreate: { [unowned self] horizontalView in
                horizontalView.fromPrevious(top: 0).matchParentWidth().height(60)
                horizontalView.add(view: moveButton,
                    onCreate: { $0.from(left: 0).matchParentHeight() },
                    onLayout: { $0.width(horizontalView.width / 2) })
                horizontalView.add(view: DemoVerticalLine.constructMedium(),
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0) })
                horizontalView.add(view: resizeButton,
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0).width(horizontalView.width / 2) })
            })
        add(view: DemoHorizontalLineStrong.constructMedium())
            .fromPrevious(top: 0).matchParentWidth()
        add(view: CSView.construct(),
            onCreate: { [unowned self] horizontalView in
                horizontalView.fromPrevious(top: 0).matchParentWidth().height(60)
                horizontalView.add(view: scalesButton,
                    onCreate: { $0.from(left: 0).matchParentHeight() },
                    onLayout: { $0.width(horizontalView.width / 2) })
                horizontalView.add(view: DemoVerticalLine.constructMedium(),
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0) })
                horizontalView.add(view: typeButton,
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0).fill(right: 0) })
            })
        heightByLastSubview()
        delegate.onOrientationChange { [unowned self] in updateLayout() }
    }

    override func onLayoutCreated() {
        super.onLayoutCreated()
        moveButton.onClick { logInfo() }
        resizeButton.onClick { logInfo() }
        scalesButton.onClick { logInfo() }
        typeButton.onClick { logInfo() }
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
