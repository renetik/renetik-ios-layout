import RenetikLayout

class ExpandSectionView: CSView {
    override class func construct() -> Self {
        super.construct().background(color: .demo_control)
    }
    var expanded = true
    let headerButton = ExpandButton.construct("Configuration")
    let lineView = HorizontalLineStrong.constructMedium()
    let itemsFrame = CSView.construct()
    let buttons = ButtonsView.construct()

    override func onCreate() {
        super.onCreate()
        add(view: headerButton).from(top: 0).matchParentWidth()
        add(view: lineView).fromPrevious(top: 0).matchParentWidth()
        add(view: itemsFrame, onCreate: { [unowned self] in
            $0.matchParentWidth()
            $0.add(view: buttons,
                onCreate: { $0.matchParentWidth() },
                onLayout: { $0.heightToFit() })
        }, onLayout: { $0.fromPrevious(top: 0).heightToFit() })
        layout { [unowned self] in heightToFit() }
        updateExpanded()
    }
    override func onCreated() {
        super.onCreated()
        headerButton.onClick { [unowned self] in
            expanded = !expanded
            updateExpanded()
            itemsFrame.updateLayout(forced: true)
        }
    }
    private func updateExpanded() {
        lineView.shown(if: expanded)
        itemsFrame.shown(if: expanded)
        headerButton.imageView.image(expanded ?
                .expand_more: .chevron_right)
    }
}
#if DEBUG
    import SwiftUI
    class ExpandSectionViewPreview: PreviewProvider, CSPreviewProvider {
        class func preview(in window: UIView) {
            window.add(view: ExpandSectionView.construct())
                .matchParentWidth().heightToFit()
        }
    }
#endif
