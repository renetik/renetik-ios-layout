import RenetikLayout

class ButtonsView: CSView {
    override class func construct() -> Self {
        super.construct().background(color: .demo_control)
    }
    let moveButton = IconTextButton.construct(icon: .open_with, title: "Move")
    let resizeButton = IconTextButton.construct(icon: .fit_screen, title: "Resize")
    let scalesButton = IconTextButton.construct(icon: .aspect_ratio, title: "Scales")
    let typeButton = IconTextButton.construct(icon: .dashboard, title: "Type")

    override func onCreateLayout() {
        super.onCreateLayout()
        add(view: CSView.construct(),
            onCreate: { [unowned self] horizontalView in
                horizontalView.fromPrevious(top: 0).matchParentWidth().height(60)
                horizontalView.add(view: moveButton,
                    onCreate: { $0.from(left: 0).matchParentHeight() },
                    onLayout: { $0.width(horizontalView.width / 2) })
                horizontalView.add(view: VerticalLine.constructMedium(),
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0) })
                horizontalView.add(view: resizeButton,
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0).width(horizontalView.width / 2) })
            })
        add(view: HorizontalLineStrong.constructMedium())
            .fromPrevious(top: 0).matchParentWidth()
        add(view: CSView.construct(),
            onCreate: { [unowned self] in
                $0.fromPrevious(top: 0).matchParentWidth().height(60)
                $0.add(view: scalesButton,
                    onCreate: { $0.from(left: 0).matchParentHeight() },
                    onLayout: { $0.width($0.superview!.width / 2) })
                $0.add(view: VerticalLine.constructMedium(),
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0) })
                $0.add(view: typeButton,
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0).fill(right: 0) })
            })
        heightByLastSubview()
    }
}

#if DEBUG
    import SwiftUI
    class ButtonsViewPreview: PreviewProvider, CSPreviewProvider {
        class func preview(in window: UIView) {
            window.add(view: ButtonsView.construct())
                .matchParentWidth().heightToFit()
        }
    }
#endif
